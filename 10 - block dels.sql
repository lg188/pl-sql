/* oef 10:
 * block deletes op auteur tussen 3am en 5am
*/

create or replace trigger nights_watch
before delete on auteur
declare
       v_time number(2,0) := to_number(sysdate,'HH');
begin
      if(v_time between '3' and '4') then
               raise_application_error(-2001,'verboden om de wall over te steken');
      end if;
end;
