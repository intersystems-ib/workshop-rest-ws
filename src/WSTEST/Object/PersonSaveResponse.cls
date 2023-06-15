Class WSTEST.Object.PersonSaveResponse Extends (Ens.Response, %JSON.Adaptor)
{

/// ID of the person
Property PersonId As %Integer;

/// Name of the person
Property Name As %String;

/// Lastname of the person
Property LastName As %String;

/// Sex of the person
Property Sex As %String;

/// DOB of the person
Property Dob As %String;

Storage Default
{
<Data name="PersonSaveResponseDefaultData">
<Subscript>"PersonSaveResponse"</Subscript>
<Value name="1">
<Value>PersonId</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>LastName</Value>
</Value>
<Value name="4">
<Value>Sex</Value>
</Value>
<Value name="5">
<Value>Dob</Value>
</Value>
</Data>
<DefaultData>PersonSaveResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
