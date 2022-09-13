package initools;

/**
 * @author EventyCodes
 * Code made for parsing INI files and returning an Array of Array<String>
**/
class INIParser
{
    public static function parseINI(ini:String):Array<Array<String>> {
        var arrayP1:Array<String> = ini.split('\n');
        var arrayP2:Array<String> = [];
        var arrayP3:Array<Array<String>> = [];

        // Remove any comments from the parsed string to avoid any problems
        for (i in arrayP1)
        {
            if (i.split('')[0] != '#' && i.split('')[0] != ';')
            {
                arrayP2.push(i);
            }
        }

        // The original string is 'WELL = no'
        // We change it to ['WELL','no']
        for (i in arrayP2)
        {
            var dArray:Array<String> = i.split(' ');
            var fArray:Array<String> = [];

            fArray.push(dArray[0]);
            fArray.push(dArray[2]);

            arrayP3.push(fArray);
        }

        return arrayP3;
    }

    public static function stringify(arr:Array<Array<String>>):String
    {
        var cookedINI:String = "";
        for (i in arr)
        {
            cookedINI += i[0] + ' = ' + i[1] + '\n';
        }
        return cookedINI;
    }

    public static function getFieldFromParsedINI(ini:Array<Array<String>>, field:String):String
    {
        var returner:String = "";
        for (i in ini)
        {
            if (i[0] == field)
            {
                returner = i[1];
            }
        }
        return returner;
    }
}