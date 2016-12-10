package ;
import com.haxepunk.Sfx;
import com.haxepunk.HXP;

class Utils
{
    public static inline function randomRange(lowerBound:Float, upperBound:Float):Float
    {
        return lowerBound + Math.random() * (upperBound - lowerBound + 1);
    }

    public static function randSign():Int
    {
        if (Math.random() > 0.5)
        {
            return -1;
        }
        else
        {
            return 1;
        }
    }

    public static inline function coinFlip(): Bool
    {
        return Math.random() > 0.5;
    }

    public static inline function mod(value:Float):Float
    {
        return value < 0 ? -value : value;
    }


    public static inline function randInt(max:Int):Int
    {
        return Math.floor(Math.random() * max);
    }

    public static function clamp(value : Float, min : Float, max : Float) : Float
    {
        if(value > max) {return max;}
        else if(value < min) {return min;}
        return value;
    }

    public static inline function onScreen(x, y, width, height)
    {
        return x > HXP.width || x + width < 0 || y + height  < 0 || y > HXP.height;
    }


    public static function aproxEq( a : Int,  b : Int, tollerance : Int = 10)
    {
        return  a <= b - tollerance && a + tollerance >= b;
    }

    public static function compareFloat(a : Float, b : Float)
    {
        if( a > b )
        {
            return 1;
        }
        if(a < b)
        {
            return -1;
        }
        return 0;
    }

    public static inline function radToDeg(angle:Float):Float
    {
        return 57.2957795 * angle;
    }

    public static inline function degToRad(angle:Float):Float
    {
        return angle / 57.2957795;
    }

    public static function linearEase(t : Float) : Float
    {
        return t;
    }

    public static function audex(x : String) : Sfx
    {


        var y : String = x;
        y = "audio/" + x +  ".wav";

        #if flash
        y = "audio/" +  x +  ".mp3";
        #end


        return new Sfx(y);
    }

    public static function distance( x : Float , y : Float , x1 : Float, y1 : Float)
    {
        var a = x1 - x;
        var b = y1 - y;

        return Math.sqrt(a*a + b*b);
    }

}
