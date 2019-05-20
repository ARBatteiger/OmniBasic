struc GUID data1, data2, data3, data41, data42, data43, data44, data45, data46, data47, data48 {
	.Data1 	dd data1
	.Data2 	dw data2
	.Data3 	dw data3
	.Data4 	db data41
				db data42
				db data43
				db data44
				db data45
				db data46
				db data47
				db data48
}
virtual at 0
	GUID GUID ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?
	sizeof.GUID = $
end virtual

macro DECLARE_INTERFACE name {
common
	label name
	virtual at 0
}

macro ENDI {
	end virtual
}

macro STDMETHOD name, num {
common
	.#name dd ?
	if ~num eq
		.#name#% = num
	end if
}

macro OBJECT name, type {
common
	name		dd ?

	macro name func, [arg] _%
	_common_
		.PARAM_COUNT = 1

		if ~ arg eq
		_reverse_
			.PARAM_COUNT = .PARAM_COUNT + 1
			push arg
		_common_
		end if

		if defined type#. ¤ func ¤ %
		if .PARAM_COUNT <> type#. ¤ func ¤ %
			display 'Param miscount (', `name, ')',13,10
		end if
		end if

		mov eax, [name]
		push eax
		mov eax, [eax]
		call [eax+type#. ¤ func]
	%_
}

macro RELEASE obj {
common
	.if [obj],ne,0
		obj Release
		mov [obj], 0
	.endif
}

DECLARE_INTERFACE IUnknown
	STDMETHOD QueryInterface, 3
	STDMETHOD AddRef, 1
	STDMETHOD Release, 1
ENDI
