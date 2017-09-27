
/*------------------------------------------------------------------------
    File        : exercice3.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Sep 26 11:45:51 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */



//Request: Calculati totalul Comenzilor date de clientii din afara statului Florida.

def var iCount as integer init 0.

DEFINE BUFFER OtherCust1 FOR Customer.
DEFINE BUFFER OtherOrd1 FOR Order.
DEFINE BUFFER OtherOrdLine1 FOR OrderLine.
for each OtherCust1 no-lock:
    if INDEX(OtherCust1.State,"FL") = 0 then do:
        For each OtherOrd1 Of OtherCust1 no-lock:
            for each OtherOrdLine1 of OtherOrd1 no-lock:
                ACCUMULATE OtherOrdLine1.price * OtherOrdLine1.Qty (TOTAL).
            end.
        end.
    end. 
end.
iCount = (ACCUM TOTAL OtherOrdLine1.price * OtherOrdLine1.Qty).
displ iCount LABEL "Total orders".


//Using Buffers and Queries

DEF VAR iCount3 AS DECIMAL INIT 0.
DEFINE BUFFER OtherCust FOR Customer.
DEFINE BUFFER OtherOrd FOR Order.
DEFINE BUFFER OtherOrdLine FOR OrderLine.
DEFINE QUERY CountOrd FOR OtherCust, OtherOrd, OtherOrdLine.

OPEN QUERY CountOrd FOR EACH OtherCust WHERE OtherCust.State <> "FL", 
                        EACH OtherOrd OF OtherCust, 
                        EACH OtherOrdLine OF OtherOrd.
GET FIRST CountOrd.

DO WHILE AVAILABLE OtherCust:
    iCount3 = iCount3 + (OtherOrdLine.Price * OtherOrdLine.Qty ).
    GET NEXT CountOrd.
END.
DISPLAY INTEGER(iCount3) LABEL "Total Oders - Query".
        


