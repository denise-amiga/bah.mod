/*
* libtcod 1.5.0
* Copyright (c) 2008,2009 J.C.Wilk
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*     * Redistributions of source code must retain the above copyright
*       notice, this list of conditions and the following disclaimer.
*     * Redistributions in binary form must reproduce the above copyright
*       notice, this list of conditions and the following disclaimer in the
*       documentation and/or other materials provided with the distribution.
*     * The name of J.C.Wilk may not be used to endorse or promote products
*       derived from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY J.C.WILK ``AS IS'' AND ANY
* EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL J.C.WILK BE LIABLE FOR ANY
* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
#include <stdlib.h> /* calloc */
#include <string.h> /* NULL/memcpy */
#include "libtcod.h"
#include "libtcod_int.h"

#define LIST(l) ((TCOD_list_int_t *)l)

typedef struct {
	void **array;
	int fillSize;
	int allocSize;
} TCOD_list_int_t;

static void TCOD_list_allocate_int(TCOD_list_t l) {
	void **newArray;
	int newSize = LIST(l)->allocSize * 2;
	if ( newSize == 0 ) newSize = 16;
	newArray = (void **)calloc(sizeof(void *),newSize );
	if ( LIST(l)->array ) {
		if ( LIST(l)->fillSize > 0 ) memcpy(newArray, LIST(l)->array, sizeof(void *)*LIST(l)->fillSize);
		free(LIST(l)->array);
	}
	LIST(l)->array=newArray;
	LIST(l)->allocSize=newSize;
}

void TCOD_list_set_size(TCOD_list_t l, int size) {
	TCOD_IFNOT(l != NULL) return;
	LIST(l)->fillSize=MIN(size,LIST(l)->allocSize);
}

TCOD_list_t TCOD_list_new() {
	return (TCOD_list_t)calloc(1,sizeof(TCOD_list_int_t));
}

TCOD_list_t TCOD_list_allocate(int nb_elements) {
	TCOD_list_t l=TCOD_list_new();
	TCOD_IFNOT(nb_elements> 0) return l;	
	LIST(l)->array = (void **)calloc(sizeof(void *),nb_elements);
	LIST(l)->allocSize = nb_elements;
	return l;
}

TCOD_list_t TCOD_list_duplicate(TCOD_list_t l) {
	int i=0;
	void **t;
	TCOD_list_int_t *ret;
	TCOD_IFNOT(l != NULL) return NULL;
	ret=(TCOD_list_int_t *)TCOD_list_new();
	while ( ret->allocSize < LIST(l)->allocSize ) TCOD_list_allocate_int((TCOD_list_t)ret);
	ret->fillSize=LIST(l)->fillSize;
	for (t=TCOD_list_begin(l); t != TCOD_list_end(l); t++) {
		ret->array[i++]=*t;
	}
	return (TCOD_list_t)ret;
}

void TCOD_list_delete(TCOD_list_t l) {
	TCOD_IFNOT(l != NULL) return;
	if ( LIST(l)->array ) free(LIST(l)->array);
	free(l);
}

void TCOD_list_push(TCOD_list_t l, const void * elt) {
	TCOD_IFNOT(l != NULL) return;
	if ( LIST(l)->fillSize+1 >= LIST(l)->allocSize ) TCOD_list_allocate_int(l);
	LIST(l)->array[LIST(l)->fillSize++] = (void *)elt;
}
void * TCOD_list_pop(TCOD_list_t l) {
	TCOD_IFNOT(l != NULL) return NULL;
	TCOD_IFNOT( LIST(l)->fillSize > 0 ) return NULL;
	return LIST(l)->array[--(LIST(l)->fillSize)];
}
void * TCOD_list_peek(TCOD_list_t l) {
	TCOD_IFNOT(l != NULL) return NULL;
	if ( LIST(l)->fillSize == 0 ) return NULL;
	return LIST(l)->array[LIST(l)->fillSize-1];
}
void TCOD_list_add_all(TCOD_list_t l, TCOD_list_t l2) {
	void **curElt;
	TCOD_IFNOT(l != NULL && l2 != NULL) return;
	for ( curElt = TCOD_list_begin(l2); curElt != TCOD_list_end(l2); curElt ++) {
		TCOD_list_push(l,*curElt);
	}
}
void * TCOD_list_get(TCOD_list_t l,int idx) {
	TCOD_IFNOT(l != NULL && idx >= 0 && idx < (LIST(l)->fillSize)) return NULL;
	return LIST(l)->array[idx];
}
void TCOD_list_set(TCOD_list_t l,int idx, const void *elt) {
	TCOD_IFNOT(l != NULL && idx >= 0 ) return;
	while ( LIST(l)->allocSize < idx+1 ) TCOD_list_allocate_int(l);
	LIST(l)->array[idx]=(void *)elt;
	if ( idx+1 > LIST(l)->fillSize ) LIST(l)->fillSize = idx+1;
}
void ** TCOD_list_begin(TCOD_list_t l) {
	TCOD_IFNOT(l != NULL ) return NULL;
	if ( LIST(l)->fillSize == 0 ) return (void **)NULL;
	return &LIST(l)->array[0];
}
void ** TCOD_list_end(TCOD_list_t l) {
	TCOD_IFNOT(l != NULL ) return NULL;
	if ( LIST(l)->fillSize == 0 ) return (void **)NULL;
	return &LIST(l)->array[LIST(l)->fillSize];
}
void **TCOD_list_remove_iterator(TCOD_list_t l, void **elt) {
	void **curElt;
	TCOD_IFNOT(l != NULL && elt != NULL) return NULL;
	for ( curElt = elt; curElt < TCOD_list_end(l)-1; curElt ++) {
		*curElt = *(curElt+1);
	}
	LIST(l)->fillSize--;
	if ( LIST(l)->fillSize == 0 ) return ((void **)NULL)-1;
	else return elt-1;
}
void TCOD_list_remove(TCOD_list_t l, const void * elt) {
	void **curElt;
	TCOD_IFNOT(l != NULL) return;
	for ( curElt = TCOD_list_begin(l); curElt != TCOD_list_end(l); curElt ++) {
		if ( *curElt == elt ) {
			TCOD_list_remove_iterator(l,curElt);
			return;
		}
	}
}
void **TCOD_list_remove_iterator_fast(TCOD_list_t l, void **elt) {
	TCOD_IFNOT(l != NULL && elt != NULL) return NULL;
	*elt = LIST(l)->array[LIST(l)->fillSize-1];
	LIST(l)->fillSize--;
	if ( LIST(l)->fillSize == 0 ) return ((void **)NULL)-1;
	else return elt-1;
}
void TCOD_list_remove_fast(TCOD_list_t l, const void * elt) {
	void **curElt;
	TCOD_IFNOT(l != NULL) return;
	for ( curElt = TCOD_list_begin(l); curElt != TCOD_list_end(l); curElt ++) {
		if ( *curElt == elt ) {
			TCOD_list_remove_iterator_fast(l,curElt);
			return;
		}
	}
}
bool TCOD_list_contains(TCOD_list_t l,const void * elt) {
	void **curElt;
	TCOD_IFNOT(l != NULL) return false;
	for ( curElt = TCOD_list_begin(l); curElt != TCOD_list_end(l); curElt ++) {
		if ( *curElt == elt ) return true;
	}
	return false;
}
void TCOD_list_clear(TCOD_list_t l) {
	TCOD_IFNOT(l != NULL) return;
	LIST(l)->fillSize=0;
}
void TCOD_list_clear_and_delete(TCOD_list_t l) {
	void **curElt;
	TCOD_IFNOT(l != NULL) return;
	for ( curElt = TCOD_list_begin(l); curElt != TCOD_list_end(l); curElt ++ ) {
		if ( *curElt != NULL ) free(*curElt);
	}
	LIST(l)->fillSize=0;
}
int TCOD_list_size(TCOD_list_t l) {
	TCOD_IFNOT(l != NULL) return 0;
	return LIST(l)->fillSize;
}
void **TCOD_list_insert_before(TCOD_list_t l,const void *elt,int before) {
	int idx;
	TCOD_IFNOT(l != NULL) return NULL;
	if ( LIST(l)->fillSize+1 >= LIST(l)->allocSize ) TCOD_list_allocate_int(l);
	for (idx=LIST(l)->fillSize; idx > before; idx--) {
		LIST(l)->array[idx]=LIST(l)->array[idx-1];
	}
	LIST(l)->array[before]=(void *)elt;
	LIST(l)->fillSize++;
	return &LIST(l)->array[before];
}
bool TCOD_list_is_empty(TCOD_list_t l) {
	TCOD_IFNOT(l != NULL) return true;
	return ( LIST(l)->fillSize == 0 );
}

