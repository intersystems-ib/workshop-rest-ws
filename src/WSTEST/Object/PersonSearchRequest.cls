Class WSTEST.Object.PersonSearchRequest Extends Ens.Request
{

Property pid As %String(MAXLEN = "");

Storage Default
{
<Data name="PersonSearchRequestDefaultData">
<Subscript>"PersonSearchRequest"</Subscript>
<Value name="1">
<Value>pid</Value>
</Value>
</Data>
<DefaultData>PersonSearchRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
