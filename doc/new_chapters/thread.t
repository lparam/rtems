@c
@c  COPYRIGHT (c) 1988-1998.
@c  On-Line Applications Research Corporation (OAR).
@c  All rights reserved.
@c
@c  $Id$
@c

@chapter Thread Manager

@section Introduction

The thread manager ...

The directives provided by the thread manager are:

@itemize @bullet
@item @code{pthread_attr_init} - 
@item @code{pthread_attr_destroy} - 
@item @code{pthread_attr_setdetachstate} - 
@item @code{pthread_attr_getdetachstate} - 
@item @code{pthread_attr_setstacksize} - 
@item @code{pthread_attr_getstacksize} - 
@item @code{pthread_attr_setstackaddr} - 
@item @code{pthread_attr_getstackaddr} - 
@item @code{pthread_attr_setscope} - 
@item @code{pthread_attr_getscope} - 
@item @code{pthread_attr_setinheritsched} - 
@item @code{pthread_attr_getinheritsched} - 
@item @code{pthread_attr_setschedpolicy} - 
@item @code{pthread_attr_getschedpolicy} - 
@item @code{pthread_attr_setschedparam} - 
@item @code{pthread_attr_getschedparam} - 
@item @code{pthread_create} - 
@item @code{pthread_exit} - 
@item @code{pthread_detach} - 
@item @code{pthread_join} - 
@item @code{pthread_self} - 
@item @code{pthread_equal} - 
@item @code{pthread_once} - 
@item @code{pthread_setschedparam} - 
@item @code{pthread_getschedparam} - 
@end itemize

@section Background

@subsection Thread Attributes

Thread attributes are utilized only at thread creation time.

@table @b
@item stack address
is the address of the optionally user specified stack area for this thread.
If this value is NULL, then RTEMS allocates the memory for the thread stack 
from the RTEMS Workspace Area.  Otherwise, this is the user specified
address for the memory to be used for the thread's stack.  Each thread must
have a distinct stack area.  Each processor family has different alignment
rules which should be followed.

@item stack size
is the minimum desired size for this thread's stack area.
If the size of this area as specified by the stack size attribute 
is smaller than the minimum for this processor family and the stack 
is not user specified, then RTEMS will automatically allocate a 
stack of the minimum size for this processor family.

@item contention scope
specifies the scheduling contention scope.  RTEMS only supports the
PTHREAD_SCOPE_PROCESS scheduling contention scope.

@item scheduling inheritance
specifies whether a user specified or the scheduling policy and 
parameters of the currently executing thread are to be used.  When 
this is PTHREAD_INHERIT_SCHED, then the scheduling policy and 
parameters of the currently executing thread are inherited by 
the newly created thread.

@item scheduling policy and parameters
specify the manner in which the thread will contend for the processor.
The scheduling parameters are interpreted based on the specified policy.
All policies utilize the thread priority parameter.

@end table

@section Operations

@section Directives

This section details the thread manager's directives.
A subsection is dedicated to each of this manager's directives
and describes the calling sequence, related constants, usage,
and status codes.

@page
@subsection pthread_attr_init

@subheading CALLING SEQUENCE:


@example
#include <pthread.h>

int pthread_attr_init(
  pthread_attr_t  *attr
);
@end example

@subheading STATUS CODES:

@table @b
@item EINVAL
The attribute pointer argument is invalid.

@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_attr_destroy

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>
 
int pthread_attr_destroy(
  pthread_attr_t  *attr
);
@end example

@subheading STATUS CODES:
 
@table @b
@item EINVAL
The attribute pointer argument is invalid.

@item EINVAL
The attribute set is not initialized.
 
@end table
 
@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_attr_setdetachstate

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>
 
int pthread_attr_setdetachstate(
  pthread_attr_t  *attr,
  int              detachstate
);
@end example

@subheading STATUS CODES:
 
@table @b
@item EINVAL
The attribute pointer argument is invalid.

@item EINVAL
The attribute set is not initialized.
 
@item EINVAL
The detachstate argument is invalid.
 
@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_attr_getdetachstate

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>
 
int pthread_attr_getdetachstate(
  const pthread_attr_t  *attr,
  int                   *detachstate
);
@end example

@subheading STATUS CODES:
 
@table @b
@item EINVAL
The attribute pointer argument is invalid.

@item EINVAL
The attribute set is not initialized.
 
@item EINVAL
The detatchstate pointer argument is invalid.

@end table
 
@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_attr_setstacksize

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>
 
int pthread_attr_setstacksize(
  pthread_attr_t  *attr,
  size_t           stacksize
);
@end example

@subheading STATUS CODES:
 
@table @b
@item EINVAL
The attribute pointer argument is invalid.

@item EINVAL
The attribute set is not initialized.
 
@end table
 
@subheading DESCRIPTION:

@subheading NOTES:

If the specified stacksize is below the minimum required for this CPU, then
the stacksize will be set to the minimum for this CPU.

@page
@subsection pthread_attr_getstacksize

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_attr_getstacksize(
  const pthread_attr_t  *attr,
  size_t                *stacksize
);
@end example

@subheading STATUS CODES:
 
@table @b
@item EINVAL
The attribute pointer argument is invalid.

@item EINVAL
The attribute set is not initialized.
 
@item EINVAL
The stacksize pointer argument is invalid.

@end table
 
@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_attr_setstackaddr

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>
 
int pthread_attr_setstackaddr(
  pthread_attr_t  *attr,
  void            *stackaddr
);
@end example

@subheading STATUS CODES:
 
@table @b
@item EINVAL
The attribute pointer argument is invalid.

@item EINVAL
The attribute set is not initialized.

@end table
 
@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_attr_getstackaddr

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_attr_getstackaddr(
  const pthread_attr_t  *attr,
  void                 **stackaddr
);
@end example

@subheading STATUS CODES:
 
@table @b
@item EINVAL
The attribute pointer argument is invalid.

@item EINVAL
The attribute set is not initialized.
 
@item EINVAL
The stackaddr pointer argument is invalid.

@end table
 
@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_attr_setscope

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_attr_setscope(
  pthread_attr_t  *attr,
  int              contentionscope
);
@end example

@subheading STATUS CODES:

@table @b
@item EINVAL
The attribute pointer argument is invalid.

@item EINVAL
The attribute set is not initialized.

@item EINVAL
The contention scope specified is not valid.

@item ENOTSUP
The contention scope specified (PTHREAD_SCOPE_SYSTEM) is not supported.

@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_attr_getscope

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_attr_getscope(
  const pthread_attr_t  *attr,
  int                   *contentionscope
);
@end example

@subheading STATUS CODES:

@table @b
@item EINVAL
The attribute pointer argument is invalid.

@item EINVAL
The attribute set is not initialized.

@item EINVAL
The contentionscope pointer argument is invalid.

@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_attr_setinheritsched

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_attr_setinheritsched(
  pthread_attr_t  *attr,
  int              inheritsched
);
@end example

@subheading STATUS CODES:

@table @b
@item EINVAL
The attribute pointer argument is invalid.

@item EINVAL
The attribute set is not initialized.

@item EINVAL
The specified scheduler inheritance argument is invalid.

@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_attr_getinheritsched

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_attr_getinheritsched(
  const pthread_attr_t  *attr,
  int                   *inheritsched
);
@end example

@subheading STATUS CODES:
@table @b
@item EINVAL
The attribute pointer argument is invalid.

@item EINVAL
The attribute set is not initialized.

@item EINVAL
The inheritsched pointer argument is invalid.

@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_attr_setschedpolicy

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_attr_setschedpolicy(
  pthread_attr_t  *attr,
  int              policy
);
@end example

@subheading STATUS CODES:
@table @b
@item EINVAL
The attribute pointer argument is invalid.

@item EINVAL
The attribute set is not initialized.
 
@item ENOTSUP
The specified scheduler policy argument is invalid.

@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_attr_getschedpolicy

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_attr_getschedpolicy(
  const pthread_attr_t  *attr,
  int                   *policy
);
@end example

@subheading STATUS CODES:
@table @b
@item EINVAL
The attribute pointer argument is invalid.

@item EINVAL
The attribute set is not initialized.

@item EINVAL
The specified scheduler policy argument pointer is invalid.

@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_attr_setschedparam

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_attr_setschedparam(
  pthread_attr_t            *attr,
  const struct sched_param   param
);
@end example

@subheading STATUS CODES:
@table @b
@item EINVAL
The attribute pointer argument is invalid.

@item EINVAL
The attribute set is not initialized.
 
@item EINVAL
The specified scheduler parameter argument is invalid.

@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_attr_getschedparam

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_attr_getschedparam(
  const pthread_attr_t  *attr,
  struct sched_param    *param
);
@end example

@subheading STATUS CODES:
@table @b
@item EINVAL
The attribute pointer argument is invalid.

@item EINVAL
The attribute set is not initialized.

@item EINVAL
The specified scheduler parameter argument pointer is invalid.

@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_create

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_create(
  pthread_t             *thread,
  const pthread_attr_t  *attr,
  void                 (*start_routine)( void * ),
  void                  *arg
);
@end example

@subheading STATUS CODES:

@table @b

@item EINVAL
The attribute set is not initialized.

@item EINVAL
The user specified a stack address and the size of the area was not 
large enough to meet this processor's minimum stack requirements.

@item EINVAL
The specified scheduler inheritance policy was invalid.

@item ENOTSUP
The specified contention scope was PTHREAD_SCOPE_PROCESS.

@item EINVAL
The specified thread priority was invalid.

@item EINVAL
The specified scheduling policy was invalid.

@item EINVAL
The scheduling policy was SCHED_SPORADIC and the specified replenishment
period is less than the initial budget.

@item EINVAL
The scheduling policy was SCHED_SPORADIC and the specified low priority
is invalid.

@item EAGAIN
The system lacked the necessary resources to create another thread, or the
self imposed limit on the total number of threads in a process
PTHREAD_THREAD_MAX would be exceeded.
 
@item EINVAL
Invalid argument passed.

@end table
 
@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_exit

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

void pthread_exit(
  void   *status
);
@end example

@subheading STATUS CODES:
@table @b
@item NONE
 
@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_detach

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_detach(
  pthread_t   thread
);
@end example

@subheading STATUS CODES:
@table @b
@item ESRCH
The thread specified is invalid.
 
@item EINVAL
The thread specified is not a joinable thread.
 
@end table

@subheading DESCRIPTION:

@subheading NOTES:

If any threads have previously joined with the specified thread, then they
will remain joined with that thread.  Any subsequent calls to pthread_join
on the specified thread will fail.

@page
@subsection pthread_join

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_join(
  pthread_t   thread,
  void      **value_ptr
);
@end example

@subheading STATUS CODES:
@table @b
@item ESRCH
The thread specified is invalid.
 
@item EINVAL
The thread specified is not a joinable thread.
 
@item EDEADLK
A deadlock was detected or thread is the calling thread.
 
@end table

@subheading DESCRIPTION:

@subheading NOTES:

If any threads have previously joined with the specified thread, then they
will remain joined with that thread.  Any subsequent calls to pthread_join
on the specified thread will fail.

If value_ptr is NULL, then no value is returned.

@page
@subsection pthread_self

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

pthread_t pthread_self( void );
@end example

@subheading STATUS CODES:

This routine returns the id of the calling thread.

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_equal

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_equal(
  pthread_t  t1,
  pthread_t  t2
);
@end example

@subheading STATUS CODES:

@table @b
@item zero
The thread ids are not equal.
 
@item non-zero
The thread ids are equal.
 
@end table

@subheading DESCRIPTION:

@subheading NOTES:

The behavior is undefined if the thread IDs are not valid.

@page
@subsection pthread_once

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

pthread_once_t once_control = PTHREAD_ONCE_INIT;

int pthread_once(
  pthread_once_t  *once_control,
  void           (*init_routine)(void)
);
@end example

@subheading STATUS CODES:

NONE

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_setschedparam

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_setschedparam(
  pthread_t           thread,
  int                 policy,
  struct sched_param *param
);
@end example

@subheading STATUS CODES:

@table @b
@item EINVAL
The scheduling parameters indicated by the parameter param is invalid.

@item EINVAL
The value specified by policy is invalid.

@item EINVAL
The scheduling policy was SCHED_SPORADIC and the specified replenishment
period is less than the initial budget.

@item EINVAL
The scheduling policy was SCHED_SPORADIC and the specified low priority
is invalid.

@item ESRCH
The thread indicated was invalid.

@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_getschedparam

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_getschedparam(
  pthread_t           thread,
  int                *policy,
  struct sched_param *param
);
@end example

@subheading STATUS CODES:
 
@table @b
@item EINVAL
The policy pointer argument is invalid.

@item EINVAL
The scheduling parameters pointer argument is invalid.

@item ESRCH
The thread indicated by the parameter thread is invalid.
 
@end table

@subheading DESCRIPTION:

@subheading NOTES:

