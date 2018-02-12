///hg_fetch_vertex_array(Shape)
/*

 Underlying HG script.

*/
var a,xx,yy;

switch (argument0) begin

 case HG_SHAPE.full:
   xx=global.HG_VERTEX_X_FULL;
   yy=global.HG_VERTEX_Y_FULL;
  break;
  
 case HG_SHAPE.circle:
  break;
  
 case HG_SHAPE.slopeLeft:
   xx=global.HG_VERTEX_X_SLOPELEFT;
   yy=global.HG_VERTEX_Y_SLOPELEFT;
  break;
  
 case HG_SHAPE.slopeRight:
   xx=global.HG_VERTEX_X_SLOPERIGHT;
   yy=global.HG_VERTEX_Y_SLOPERIGHT;
  break;
  
 case HG_SHAPE.slopeTopLeft:
   xx=global.HG_VERTEX_X_SLOPETOPLEFT;
   yy=global.HG_VERTEX_Y_SLOPETOPLEFT;
  break;
  
 case HG_SHAPE.slopeTopRight:
   xx=global.HG_VERTEX_X_SLOPETOPRIGHT;
   yy=global.HG_VERTEX_Y_SLOPETOPRIGHT;
  break;
  
 case HG_SHAPE.slabLeft:
   xx=global.HG_VERTEX_X_SLABLEFT;
   yy=global.HG_VERTEX_Y_SLABLEFT;
  break;
  
 case HG_SHAPE.slabRight:
   xx=global.HG_VERTEX_X_SLABRIGHT;
   yy=global.HG_VERTEX_Y_SLABRIGHT;
  break;
  
 case HG_SHAPE.slabTop:
   xx=global.HG_VERTEX_X_SLABTOP;
   yy=global.HG_VERTEX_Y_SLABTOP;  
  break;
  
 case HG_SHAPE.slabBottom:
   xx=global.HG_VERTEX_X_SLABBOTTOM;
   yy=global.HG_VERTEX_Y_SLABBOTTOM;
  break;
  
 case HG_SHAPE.slopeSmRight:
   xx=global.HG_VERTEX_X_SLOPESMRIGHT;
   yy=global.HG_VERTEX_Y_SLOPESMRIGHT;
  break;
 
 case HG_SHAPE.slopeSmLeft:
   xx=global.HG_VERTEX_X_SLOPESMLEFT;
   yy=global.HG_VERTEX_Y_SLOPESMLEFT;   
  break;  
  
 case HG_SHAPE.slopeSmTopRight:
   xx=global.HG_VERTEX_X_SLOPESMTOPRIGHT;
   yy=global.HG_VERTEX_Y_SLOPESMTOPRIGHT; 
  break;
 
 case HG_SHAPE.slopeSmTopLeft:
   xx=global.HG_VERTEX_X_SLOPESMTOPLEFT;
   yy=global.HG_VERTEX_Y_SLOPESMTOPLEFT;  
  break;  
  
 case HG_SHAPE.slopeSmElevRight:
   xx=global.HG_VERTEX_X_SLOPESMELEVRIGHT;
   yy=global.HG_VERTEX_Y_SLOPESMELEVRIGHT;
  break;
  
 case HG_SHAPE.slopeSmElevLeft:
   xx=global.HG_VERTEX_X_SLOPESMELEVLEFT;
   yy=global.HG_VERTEX_Y_SLOPESMELEVLEFT;
  break;
  
 case HG_SHAPE.slopeSmElevTopRight:
   xx=global.HG_VERTEX_X_SLOPESMELEVTOPRIGHT;
   yy=global.HG_VERTEX_Y_SLOPESMELEVTOPRIGHT;
  break;
  
 case HG_SHAPE.slopeSmElevTopLeft:
   xx=global.HG_VERTEX_X_SLOPESMELEVTOPLEFT;
   yy=global.HG_VERTEX_Y_SLOPESMELEVTOPLEFT;
  break;
 
 default:
  break;

end;

a[0]=xx;
a[1]=yy;

return a;
