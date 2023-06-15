Class WSTEST.Object.PersonSaveRequest Extends Ens.Request
{

Property JSON As %String(MAXLEN = "");

Storage Default
{
<Data name="PersonSaveRequestDefaultData">
<Subscript>"PersonSaveRequest"</Subscript>
<Value name="1">
<Value>JSON</Value>
</Value>
</Data>
<DefaultData>PersonSaveRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
