__UnVectorize:
; Enter with vector addr in esi
push ebx; Save _True flag
mov edi,[esi]; Get root ptr
xor ebx,ebx; Clear root len
__UnVec1:
mov ecx,[esi]; Get src ptr
dec ecx; prep for pre-inc
mov edx,[esi+4]; Get src len
__UnVec2:
inc ecx: Point to next byte
test byte [ecx],255
je __UnVec3
inc ebx: Bump root len
dec edx: Dec vec len
jne __UnVec2; Do next byte
__UnVec3:
mov ecx,[esi+8]; Get src lnk
or ecx,ecx; Set z flag
je __UnVecDone
mov esi,ecx; Move lnk to vec addr
jp __UnVec1; Process new vec
__UnVecDone:

pop ebx; Restore _True flag
ret
