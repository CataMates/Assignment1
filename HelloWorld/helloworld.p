/*def var cHello as char no-undo.    */
/*def var iNumber as integer no-undo.*/
/*                                   */
/*cHello = "Welcome to Yonder !".    */
/*aNumber = 3.                       */
/*                                   */
/*MESSAGE cHello                     */
/*MESSAGE aNumber                    */
/*VIEW-AS ALERT-BOX.                 */

/*DISPLAY "Enter your name".         */
/*                                   */
/*def var num as integer no-undo.    */
/*num = 12.                          */
/*def var another as integer no-undo.*/
/*another = 13.                      */
/*DISPLAY MAXIMUM(num, another).     */

/*def var dDate as DATE no-undo.  */
/*dDate = 9/25/2017.              */
/*def var iDay as integer no-undo.*/
/*iDay = WEEKDAY(dDate).          */
/*DISPLAY iDay.                   */

/* mainproc.p */
/* This is scoped to the whole external procedure. */
/*DEFINE VARIABLE iVar1 AS INTEGER NO-UNDO INITIAL 24.*/
/*DEFINE VARIABLE iVar2 AS INTEGER NO-UNDO INITIAL 27.*/
/*RUN subproc.                                        */
/*                                                    */
/*PROCEDURE subproc:                                  */
/*                                                    */
/*END PROCEDURE.                                      */