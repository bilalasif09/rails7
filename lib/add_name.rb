class AddName
  def self.query _limit
    <<-SQL
      CALL add_name(#{_limit});
    SQL
  end
  def self.procedure
    <<-SQL
      CREATE OR REPLACE PROCEDURE add_name(_limit int) AS $$
      DECLARE
        _offset int := (Select count(*) from users where name is not null);
        rec record;
        str text := 'update users set name = (case id';
        ids text := '';
        itr int := 0;
      BEGIN
        for rec in select first_name, last_name, id from users limit _limit offset _offset loop
          itr = itr + 1;
          str = concat(str, ' when ', rec.id, ' then ', '''', concat(rec.first_name, ' ', rec.last_name), '''');
          IF itr < _limit THEN
            ids = concat(ids, rec.id, ',');
          ELSE
            ids = concat(ids, rec.id);
          END IF;
        end loop;
        str = concat(str, ' else name end) where id in (', ids, ')');
        EXECUTE str;
      END;
      $$ LANGUAGE plpgsql;
    SQL
  end
end