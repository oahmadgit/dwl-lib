import * from dw::core::Objects

fun jsonPathCalculator(data,path,node,nodeValue) =  if((data is Object) == false) data else
    data mapObject ((value, key, index) -> 
        value match {
            case value is Object -> 
                jsonPathCalculator(value,path ++ "." ++ key,node,nodeValue)
            case value is Array -> (key) : value map (jsonPathCalculator($,path  ++ "." ++ key ++ "[" ++ $$ ++ "]",node,nodeValue))
            else -> 
                if (((key)~= node) and value ~=nodeValue)
                    {
                        value: value,
                        valuePath: path
                    }
                else
                    {} 
        }
    )
