/* oef 7:
 * vind het aantel stuks en naam van het boek met isbn 1345001254
*/
declare
  v_naam boek.naam%type := "";
  v_aantal caddy.aantal%type := 0;
begin
  select boek.naam from boek into v_naam where boek.isbn = 1345001254;

  from rec in ( select aantal from caddy_boek where isbn = 1345001254 ) loop
       v_aantal := v_aantal + rec.aantal;
  end loop;

  dbms_output.put_line(v_naam || ':' || v_aantal);
end;
