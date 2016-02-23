LaserStart <- EntityGroup[0].GetOrigin();
LaserEnd <- EntityGroup[1].GetOrigin();

function DrawLaser(r, g, b, timeLength, ignoreZ) {
	DebugDrawLine(LaserStart, LaserEnd, r, g, b, ignoreZ, timeLength);
}
