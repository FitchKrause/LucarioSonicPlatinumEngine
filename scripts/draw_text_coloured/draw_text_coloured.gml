/// @description  draw_text_coloured(x, y, string, xscale, yscale, alpha)
/// @param x
/// @param  y
/// @param  string
/// @param  xscale
/// @param  yscale
/// @param  alpha
function draw_text_coloured() {

	// Script by Yan Hülsebusch aka Chinafreak (Hule Studios)
	// 31.07.2014
	// return string without commands

	// use [$='COLOR DIGITS'] to change color of text 
	// Example:
	/*
	    [$="+string(c_white)+"]White text by constant variable!
	    [$="+string(make_color_rgb(20,30,90))+"]Colored Text by make_color_rgb/hsv!
	    [$=8388736]or colored text in digits!
	*/

	var _x = argument[0];
	var _y = argument[1];
	var _str = argument[2];
	var _xscale = argument[3];
	var _yscale = argument[4];
	var _alpha = argument[5];

	var _precol = draw_get_color();
	var _prealpha = draw_get_alpha();

	var _strab = _str;
	_str = "";

	var v1 = 0;
	var v2 = 0;
	var v3 = 0;
	var d_color = c_white;

	var str_part, str_color;
	var str_check = false;
	var str_length = 0;
	var str_height = 0;
	str_color[0] = _precol;
	str_part[0] = "";

	draw_set_alpha(_alpha);
	var i = 0;
	while(string_length(_strab) > 0)
	{

	        if string_copy(_strab,0,3) = "[$="{
	            str_color[i] = string_copy(_strab,string_pos("[$=",_strab)+3,string_pos("]",_strab)-string_pos("[$=",_strab)-3)
	            _strab = string_replace(_strab,string_copy(_strab,0,string_pos("]",_strab)),"")
	            str_check = false
	       }else{
	          if str_check{
	            str_check = false
	            str_color[i] = str_color[i-1]
	          }else{
	            str_color[i] = string(_precol)
	          }
	       }

	       var _substr;
	       if string_copy(_strab,string_pos("[$=",_strab),3) == "[$="{ 
	          _substr = string_copy(_strab,0,string_pos("[$=",_strab)-1)
	       }else{
	          _substr = _strab
	       }
	       if string_copy(_substr,string_pos("#",_substr),1) == "#"{
	          str_part[i] = string_copy(_strab,0,string_pos("#",_strab)-1)
	          str_check = true
	          _strab = string_replace(_strab,string_copy(_strab,0,string_pos("#",_strab)),"")
                
	       }else{
       
	       if string_copy(_strab,string_pos("[$=",_strab),3) == "[$="{
	          str_part[i] = string_copy(_strab,0,string_pos("[$=",_strab)-1)
	       }else{
	          str_part[i] = _strab
	          _strab = ""
	       }
	       _strab = string_replace(_strab,string_copy(_strab,0,string_pos("[$=",_strab)-1),"")
       
	       }
	       //show_message(string(string_copy(str_color[i],0,2)))
	       if string_copy(str_color[i],0,3) = "rgb"{
	            str_color[i] = string_replace(str_color[i],"rgb(","")
	            str_color[i] = string_replace(str_color[i],")","")
	            v1 = string_extract(str_color[i],",",0)
	            v2 = string_extract(str_color[i],",",1)
	            v3 = string_extract(str_color[i],",",2)
	            d_color = make_colour_rgb(real(v1),real(v2),real(v3))
	       }else if string_copy(str_color[i],0,3) = "hsv"{
	            str_color[i] = string_replace(str_color[i],"hsv(","")
	            str_color[i] = string_replace(str_color[i],")","")
	            v1 = string_extract(str_color[i],",",0)
	            v2 = string_extract(str_color[i],",",1)
	            v3 = string_extract(str_color[i],",",2)
	            d_color = make_colour_hsv(real(v1),real(v2),real(v3))
	       }else{
	            var constant;
	            constant = (string_digits(str_color[i]) != str_color[i])
            
	            if constant{
	                d_color = real(asset_get_index(str_color[i]))
	            }else{
	                d_color= real(str_color[i])
	            }
	       }
       
	       draw_set_colour(d_color)
	       draw_text_transformed(_x + str_length, _y + str_height, str_part[i], _xscale, _yscale, 0);
	       str_length += string_width(str_part[i]) * _xscale;
	       _str += str_part[i]
	       if str_check{
	          str_length = 0 
	          str_height += string_height("A") * _yscale
	       }       
	i++
	}

	draw_set_alpha(_prealpha)
	draw_set_color(_precol)

	return _str



}
