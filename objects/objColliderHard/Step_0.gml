/// @description  Move with parent

if (parent <> noone)
{
	if instance_exists(parent)
	{
	    if ((parent.x - parent.xprevious) <> 0) { x += parent.x - parent.xprevious; }
	    if ((parent.y - parent.yprevious) <> 0) { y += parent.y - parent.yprevious; }
	}
}