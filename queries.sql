/*PRACTICA DE JOIN:  INNER, LEFT, RIGHT, FULL OUTER.
--Nota: MySQL no soporta FULL JOIN, asi que debes combinar con JOIN
*/

/*
    Petición: Lista de asistencia de cada dia del evento dado para un alumno en particular
*/
SELECT G.guest_id, concat(G.name,' ', G.last_name) AS 'ALUMNO',  
       EU.name AS 'EVENTO', ED.start_time AS 'FECHA', 
       ED.schedule AS 'Itinerario', ST.name AS 'ASISTENCIA'
    FROM guest G 
        LEFT JOIN assistance A
            ON G.guest_id= A.guest_id
        INNER JOIN status_assistance ST
            ON A.status_assistance_id= ST.status_assistance_id
        INNER JOIN event_day ED 
            ON A.event_day_id= ED.event_day_id
        INNER JOIN event_uc EU
            ON ED.event_uc_id = EU.event_uc_id
    WHERE ED.event_uc_id =1
        AND G.guest_id=2;

--QUIERO LOS EVENTOS DE ESTE AÑO 
--DONDE EL NÚMERO DE ALUMNOS REGISTRADOS HAYA SIDO MAYOR A 5
-- Y NO HAYA HABIDO INASISTENCIAS


--INNER JOIN:  invitados inscritos a un evento.
SELECT G.guest_id, G.name, G.last_name
    FROM guest G 
    INNER JOIN guest_event GE 
    ON G.guest_id= GE.guest_id
    WHERE GE.event_uc_id=1

--LEFT JOIN: Lista de invitados con sus eventos
--Si fuera un inner, solo me traeria alumnos inscritos a algun evento
SELECT G.guest_id, G.name, G.last_name, GE.event_uc_id
    FROM guest G
        LEFT JOIN 
        guest_event GE ON
        G.guest_id = GE.guest_id;







--SELECT * FROM event_uc 
--WHERE start_date >= CAST('2020-11-04' AS datetime) 