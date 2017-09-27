
/*------------------------------------------------------------------------
    File        : exercice2.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Sep 26 11:23:35 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

//Request: Afisati numele tuturor angajatilor (Employee) care locuiesc pe strada "Springs Rd".

DEFINE BUFFER OtherEmp1 FOR Employee.

FOR EACH OtherEmp1 no-lock :
    IF INDEX(OtherEmp1.Address, "Springs Rd") > 0 then do:
        DISPLAY OtherEmp1.LastName OtherEmp1.FirstName OtherEmp1.Address.
    end.
END.


//Using Buffers and Queries

DEFINE BUFFER OtherEmp2 FOR Employee.

DEFINE QUERY EmpAdr FOR OtherEmp2.
OPEN QUERY EmpAdr FOR EACH OtherEmp2.
GET FIRST EmpAdr.

DEF VAR iCount AS INTEGER INIT 0.

DO WHILE AVAILABLE OtherEmp2:
    if INDEX(OtherEmp2.Address, "Springs Rd") > 0 then do:
        DISPLAY OtherEmp2.LastName OtherEmp2.FirstName OtherEmp2.Address.
        iCount = iCount + 1.
    end.
    GET NEXT EmpAdr.
END.
    
    

