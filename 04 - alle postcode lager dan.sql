/* oef 4:
 * print alle postcodes lager dan 3500
*/

BEGIN
  for rec
  in (select postcode, gemeente from gemeente where postcode <= 3500)
  loop
    dbms_output.put_line(rec.gemeente);
  end loop;
END;
