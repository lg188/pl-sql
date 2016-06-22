/* oef 7:
 * vind het aantel stuks en naam van het boek met isbn 1345001254
*/
declare
  v_titel boek.titel%type := '';
  v_aantal caddy_boek.aantal%type := 0;
begin
  select boek.titel into v_titel from boek where boek.isbn = 1345001254;

  for rec in ( select caddy_boek.aantal from caddy_boek where isbn = 1345001254 ) loop
       v_aantal := v_aantal + rec.aantal;
  end loop;
  if(v_aantal != 0) then
    dbms_output.put_line(v_titel || ':' || v_aantal);
  else
    raise_application_error(-2001, 'you done fucked up');
  end if;
end;
