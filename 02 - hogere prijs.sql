/* Oef 2:
 * een procedure die de prijs van allen boeken met een isbn nummer lager dan
 * 1450025896 verhoogt met 15%
 */
 
create or replace procedure upd_bookprice( p_isbn in BOEK.ISBN%type) is
  v_isbn boek.isbn%type;
  e_isbn_error exception;
begin
  -- locate record
  select isbn
  into v_isbn
  from boek
  where boek.isbn = p_isbn;
  -- check als de isbn klopt
  if(v_isbn < 1450025896) then
    -- update de record
    update boek
    set  boek.prijs = boek.prijs * 1.15
    where boek.isbn = p_isbn;
    dbms_output.put_line('de prijs van boek(' ||  p_isbn || ') werd verhoogd');
  else
    raise e_isbn_error;
end if;
exception
  when no_data_found then
    raise_application_error(-20001, 'de isbn bestaat niet');
  when e_isbn_error then
    raise_application_error(-20001, 'de isbn is hoger dan 1450025896');
end upd_bookprice;

/* originele incorrect
create or replace procedure  prijs_verhoging
as
begin
  DBMS_OUTPUT.PUT_LINE('');
  for boek_rec
  in (select isbn, prijs from boek where isbn < 1450025896 )
  loop
    boek_rec.prijs := boek_rec.prijs * 1.15;
  end loop;
end prijs_verhoging;

*/
