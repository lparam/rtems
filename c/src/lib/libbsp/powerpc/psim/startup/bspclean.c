/*
 *  COPYRIGHT (c) 1989-1999.
 *  On-Line Applications Research Corporation (OAR).
 *
 *  The license and distribution terms for this file may be
 *  found in the file LICENSE in this distribution or at
 *  http://www.rtems.com/license/LICENSE.
 *
 *  $Id$
 */

void bsp_cleanup( void )
{
  asm volatile( "li  10,99" );  /* 0x63 */
  asm volatile( "sc" );
}