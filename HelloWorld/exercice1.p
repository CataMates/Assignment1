
/*------------------------------------------------------------------------
    File        : exercices.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Sep 26 10:37:38 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */



//Request: Afisati numele tuturor clientilor (Customer) cu comenzi(Order) date in ultima zi a lunii, 
//precum si data comenzii si ziua din saptamana in care a fost data comanda.

def var dateOfOrder as date.
def var cDays as character init "Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday".

DEFINE BUFFER OtherCust1 FOR Customer.
DEFINE BUFFER OtherOrd1 FOR Order.

for each OtherCust1 no-lock:
    for each OtherOrd1 of OtherCust1:
        
        ASSIGN
            dateOfOrder = add-interval(OtherOrd1.OrderDate,1,"days").
        if month(dateOfOrder) <> month(OtherOrd1.OrderDate) then do:
            displ OtherCust1.name LABEL "Customer Name".
            displ OtherOrd1.OrderDate LABEL "Date of Order".
            displ ENTRY(WEEKDAY(OtherOrd1.OrderDate),cDays) LABEL "Day of the Week" FORMAT "x(10)".
        end.
    end.
        
End.

//Using Buffers and Queries

DEFINE BUFFER OtherCust2 FOR Customer.
DEFINE BUFFER OtherOrd2 FOR Order.

DEFINE QUERY OrdDay FOR OtherCust2, OtherOrd2.

OPEN QUERY OrdDay FOR EACH OtherCust2, 
                      EACH OtherOrd2 OF OtherCust2.
GET FIRST OrdDay.

DO WHILE AVAILABLE OtherCust2:
    ASSIGN
        dateOfOrder = add-interval(OtherOrd2.OrderDate,1,"days").
        if month(dateOfOrder) <> month(OtherOrd2.OrderDate) then do:
            displ OtherCust2.name LABEL "Customer Name".
            displ OtherOrd2.OrderDate LABEL "Date of Order".
            displ ENTRY(WEEKDAY(OtherOrd2.OrderDate),cDays) LABEL "Day of the Week" FORMAT "x(10)".
        end.
    GET NEXT OrdDay.
END.
   


    