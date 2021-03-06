familia(
    persona(
        [tomas,garcia,perez],
        fecha(7,mayo,1960),
        trabajo(profesor,60)
    ),
    persona(
        [ana,lopez,ruiz],
        fecha(10,marzo,1962),
        trabajo(medica,90)
    ),
    [
        persona(
            [juan,garcia,lopez],
            fecha(5,enero,1990),
            estudiante
        ),
        persona(
            [maria,garcia,lopez],
            fecha(12,abril,1992),
            estudiante
        )
    ]
).

familia(
    persona(
        [jose,perez,ruiz],
        fecha(6,marzo,1963),
        trabajo(pintor,120)
    ),
    persona(
        [luisa,galvez,perez],
        fecha(12,mayo,1964),
        trabajo(medica,90)
    ),
    [
        persona(
            [juan_luis,perez,perez],
            fecha(5,febrero,1990),
            estudiante
        ),
        persona(
            [maria_jose,perez,perez],
            fecha(12,junio,1992),
            estudiante
        ),
        persona(
            [jose_maria,perez, perez],
            fecha(12,julio,1994),
            estudiante
        )
    ]
).

casado(X) :-
    familia(X,_,_).

casada(X) :-
    familia(_,X,_).

hijo(X) :-
    familia(_,_,L),
    member(X,L).

persona(X) :-
    casado(X),
    casada(X),
    hijo(X).

fecha_de_nacimiento(persona(_,Y,_),Y).

sueldo(persona(_,_,trabajo(_,Y)),Y).
sueldo(persona(_,_,estudiante),0).

total([],0).
total([X|L],Y) :-
    sueldo(X,Y1),
    total(L,Y2),
    Y is Y1 + Y2.
