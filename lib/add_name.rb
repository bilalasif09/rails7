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
      BEGIN
        for rec in select first_name, last_name, id from users order by id asc limit _limit offset _offset loop
          update users set name = concat(rec.first_name, ' ', rec.last_name) where id = rec.id;
        end loop;
      END;
      $$ LANGUAGE plpgsql;
    SQL
  end
end