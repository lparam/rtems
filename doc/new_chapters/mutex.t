@c
@c  COPYRIGHT (c) 1988-1998.
@c  On-Line Applications Research Corporation (OAR).
@c  All rights reserved.
@c
@c  $Id$
@c

@chapter Mutex Manager

@section Introduction

The mutex manager ...

The directives provided by the mutex manager are:

@itemize @bullet
@item @code{pthread_mutexattr_init} - 
@item @code{pthread_mutexattr_destroy} - 
@item @code{pthread_mutexattr_setprotocol} - 
@item @code{pthread_mutexattr_getprotocol} - 
@item @code{pthread_mutexattr_setprioceiling} - 
@item @code{pthread_mutexattr_getprioceiling} - 
@item @code{pthread_mutexattr_setpshared} - 
@item @code{pthread_mutexattr_getpshared} - 
@item @code{pthread_mutex_init} - 
@item @code{pthread_mutex_destroy} - 
@item @code{pthread_mutex_lock} - 
@item @code{pthread_mutex_trylock} - 
@item @code{pthread_mutex_timedlock} - 
@item @code{pthread_mutex_unlock} - 
@item @code{pthread_mutex_setprioceiling} - 
@item @code{pthread_mutex_getprioceiling} - 
@end itemize

@section Background

@section Operations

@section Directives

This section details the mutex manager's directives.
A subsection is dedicated to each of this manager's directives
and describes the calling sequence, related constants, usage,
and status codes.

@page
@subsection pthread_mutexattr_init

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_mutexattr_init(
  pthread_mutexattr_t *attr
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
@subsection pthread_mutexattr_destroy

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_mutexattr_destroy(
  pthread_mutexattr_t *attr
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
@subsection pthread_mutexattr_setprotocol

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_mutexattr_setprotocol(
  pthread_mutexattr_t   *attr,
  int                    protocol
);
@end example

@subheading STATUS CODES:

@table @b
@item EINVAL
The attribute pointer argument is invalid.

@item EINVAL
The attribute set is not initialized.
 
@item EINVAL
The protocol argument is invalid.
 
@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_mutexattr_getprotocol
 
@subheading CALLING SEQUENCE:
 
@example
#include <pthread.h>
 
int pthread_mutexattr_getprotocol(
  pthread_mutexattr_t   *attr,
  int                   *protocol
);
@end example
 
@subheading STATUS CODES:
 
@table @b
@item EINVAL
The attribute pointer argument is invalid.

@item EINVAL
The attribute set is not initialized.
 
@item EINVAL
The protocol pointer argument is invalid.
 
@end table
 
@subheading DESCRIPTION:
 
@subheading NOTES:

@page
@subsection pthread_mutexattr_setprioceiling

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_mutexattr_setprioceiling(
  pthread_mutexattr_t   *attr,
  int                    prioceiling
);
@end example

@subheading STATUS CODES:
 
@table @b
@item EINVAL
The attribute pointer argument is invalid.

@item EINVAL
The attribute set is not initialized.
 
@item EINVAL
The prioceiling argument is invalid.
 
@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_mutexattr_getprioceiling

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_mutexattr_getprioceiling(
  const pthread_mutexattr_t   *attr,
  int                         *prioceiling
);
@end example

@subheading STATUS CODES:
 
@table @b
@item EINVAL
The attribute pointer argument is invalid.

@item EINVAL
The attribute set is not initialized.
 
@item EINVAL
The prioceiling pointer argument is invalid.
 
@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_mutexattr_setpshared

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_mutexattr_setpshared(
  pthread_mutexattr_t   *attr,
  int                    pshared
);
@end example

@subheading STATUS CODES:
 
@table @b
@item EINVAL
The attribute pointer argument is invalid.

@item EINVAL
The attribute set is not initialized.
 
@item EINVAL
The pshared argument is invalid.
 
@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_mutexattr_getpshared

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_mutexattr_getpshared(
  const pthread_mutexattr_t   *attr,
  int                         *pshared
);
@end example

@subheading STATUS CODES:
 
@table @b
@item EINVAL
The attribute pointer argument is invalid.

@item EINVAL
The attribute set is not initialized.
 
@item EINVAL
The pshared pointer argument is invalid.
 
@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_mutex_init

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_mutex_init(
  pthread_mutex_t           *mutex,
  const pthread_mutexattr_t *attr
);
@end example

@subheading STATUS CODES:

@table @b
@item EINVAL
The attribute set is not initialized.
 
@item EINVAL
The specified protocol is invalid.

@item EAGAIN
The system lacked the necessary resources to initialize another mutex.

@item ENOMEM
Insufficient memory exists to initialize the mutex.

@item EBUSY
Attempted to reinialize the object reference by mutex, a previously
initialized, but not yet destroyed.

@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_mutex_destroy

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_mutex_destroy(
  pthread_mutex_t           *mutex
);
@end example

@subheading STATUS CODES:
 
@table @b
@item EINVAL
The specified mutex is invalid.

@item EBUSY
Attempted to destroy the object reference by mutex, while it is locked or
referenced by another thread.
 
@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_mutex_lock

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_mutex_lock(
  pthread_mutex_t           *mutex
);
@end example

@subheading STATUS CODES:

@table @b
@item EINVAL
The specified mutex is invalid.

@item EINVAL
The mutex has the protocol attribute of PTHREAD_PRIO_PROTECT and the 
priority of the calling thread is higher than the current priority
ceiling.

@item EDEADLK
The current thread already owns the mutex.

@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_mutex_trylock
 
@subheading CALLING SEQUENCE:
 
@example
#include <pthread.h>
 
int pthread_mutex_trylock(
  pthread_mutex_t           *mutex
);
@end example
 
@subheading STATUS CODES:
 
@table @b
@item EINVAL
The specified mutex is invalid.
 
@item EINVAL
The mutex has the protocol attribute of PTHREAD_PRIO_PROTECT and the
priority of the calling thread is higher than the current priority
ceiling.
 
@item EDEADLK
The current thread already owns the mutex.
 
@end table
 
@subheading DESCRIPTION:
 
@subheading NOTES:
 
@page
@subsection pthread_mutex_timedlock
 
@subheading CALLING SEQUENCE:
 
@example
#include <pthread.h>
#include <time.h>
 
int pthread_mutex_timedlock(
  pthread_mutex_t           *mutex,
  const struct timespec     *timeout
);
@end example
 
@subheading STATUS CODES:
 
@table @b
@item EINVAL
The specified mutex is invalid.
 
@item EINVAL
The nanoseconds field of timeout is invalid.

@item EINVAL
The mutex has the protocol attribute of PTHREAD_PRIO_PROTECT and the
priority of the calling thread is higher than the current priority
ceiling.
 
@item EDEADLK
The current thread already owns the mutex.

@end table
 
@subheading DESCRIPTION:
 
@subheading NOTES:
 

@page
@subsection pthread_mutex_unlock

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_mutex_unlock(
  pthread_mutex_t           *mutex
);
@end example

@subheading STATUS CODES:

@table @b
@item EINVAL
The specified mutex is invalid.
 
@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_mutex_setprioceiling

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_mutex_setprioceiling(
  pthread_mutex_t   *mutex,
  int                prioceiling,
  int               *oldceiling
);
@end example

@subheading STATUS CODES:
 
@table @b
@item EINVAL
The oldceiling pointer parameter is invalid.

@item EINVAL
The prioceiling parameter is an invalid priority.

@item EINVAL
The specified mutex is invalid.
 
@end table

@subheading DESCRIPTION:

@subheading NOTES:

@page
@subsection pthread_mutex_getprioceiling

@subheading CALLING SEQUENCE:

@example
#include <pthread.h>

int pthread_mutex_getprioceiling(
  pthread_mutex_t   *mutex,
  int               *prioceiling
);
@end example

@subheading STATUS CODES:
 
@table @b
@item EINVAL
The prioceiling pointer parameter is invalid.

@item EINVAL
The specified mutex is invalid.
 
@end table

@subheading DESCRIPTION:

@subheading NOTES:

