;declares a cdecl procedure
macro cproc name,[params]
{
	common
	name:
	push ebp
	mov ebp, esp		
	
	virtual at ebp +8		  

	if ~ params eq    
		forward
			local ..params 		
			..params dd ?
 			params equ ..params
		common
	end if
	end virtual
	local ..dynamic_data,..dynamic_size
	dynamic_data equ ..dynamic_data
	dynamic_size equ ..dynamic_size
	virtual at ebp - dynamic_size
	dynamic_data:
}

macro center
{	
		dynamic_size = $ - dynamic_data
   end virtual
   sub esp,dynamic_size
}

macro cret
{	
	add esp,dynamic_size
	pop ebp
	ret	
}

;calling/ invoking a cdecl procedure

macro ccall proc,[arg]		; call cdecl procedure
{ 
	common
		local ..param_num 
		..param_num=0		
	reverse
		push arg
		..param_num = ..param_num + 4		
	common
		call proc 
		add esp, ..param_num		
}

macro cinvoke proc,[arg] 		; invoke cdecl procedure (indirect)
{
	common
		if ~ arg eq
 			ccall [proc],arg
		else
 			call [proc]
	end if 
}