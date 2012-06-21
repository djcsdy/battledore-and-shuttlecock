package battledore_and_shuttlecock;

import hopscotch.collision.BoxMask;
import hopscotch.graphics.Image;
import flash.display.BitmapData;
import flash.geom.Point;
import hopscotch.Entity;

class Shuttlecock extends Entity {
    public static inline var WIDTH = 8;
    public static inline var HEIGHT = 8;

    static inline var GRAVITY = 0.1;

    public var prevX(default, null):Float;
    public var prevY(default, null):Float;

    public var velocity:Point;

    public function new() {
        super();

        prevX = 0;
        prevY = 0;

        velocity = new Point();

        var image = new Image(new BitmapData(WIDTH, HEIGHT, false, 0xffffff));
        image.centerOrigin();
        graphic = image;

        collisionMask = new BoxMask(-image.originX, -image.originY, WIDTH, HEIGHT);
    }

    override public function begin(frame:Int) {
        super.begin(frame);

        prevX = 0;
        prevY = 0;
    }

    override public function update(frame:Int) {
        super.update(frame);

        prevX = x;
        prevY = y;

        velocity.y += GRAVITY;

        x += velocity.x;
        y += velocity.y;
    }
}
