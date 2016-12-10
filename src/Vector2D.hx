package ;

/**
 * ...
 * @author Leo Mahon
 */
class Vector2D
{
	public var x:Float;
	public var y:Float;

	public function new(x:Float,y:Float)
	{
		this.x = x;
		this.y = y;

	}

	public function add(v : Vector2D) : Void
	{
		x += v.x;
		y += v.y;
	}

	public function sub(v : Vector2D) : Void
	{
		x -= v.x;
		y -= v.y;
	}

	public function addR(v : Vector2D) : Vector2D
	{
		return new Vector2D(this.x + v.x, this.y + v.y);
	}

	public function subR(v : Vector2D) : Vector2D
	{
		return new Vector2D(this.x - v.x, this.y - v.y);
	}


	public function scale(k: Float) : Void
	{
		x *= k;
		y *= k;
	}

	public function scaled(k : Float) : Vector2D
	{
		return new Vector2D(x * k, y * k);
	}

	public function returnScaled(k: Float) : Vector2D
	{
		return new Vector2D(x * k, y * k);
	}

	public function distance(v :Vector2D): Float
	{
		return  Math.sqrt((this.x - v.x) * (this.x - v.x) + (this.y - v.y) * (this.y - v.y));
	}


	public function magnitude()
	{
		return Math.sqrt(x*x + y*y);
	}

	public function normalize()
	{
		var m = magnitude();
		scale(1/m);
	}

	public function normalized()
	{
		var m = magnitude();
		return new Vector2D(x/m,y/m);
	}

	public function zero()
	{
		x = y = 0;
	}
}