
function scr_energia(_energia_max) constructor{
	
	//vida total
	energia_max = _energia_max
	//vida atual
	energia = energia_max;
	energia_temp = energia;
	energia_fundo = energia
	
	static perde_energia = function(_quantidade = 1)
	{
		energia -= _quantidade;
		energia = clamp(energia, 0, energia_max)
		return energia;
	}
	
	static ganha_energia = function(_quantidade = 1)
	{
		energia += _quantidade;
		energia = clamp(energia, 0, energia_max)
		return energia;
	}
	
	//metodo vida
	///@function desenha_vida(x, y, largura, altura, [cor1], [cor2], [cor3]);
	static desenha_energia= function(_x, _y, _largura, _altura, _cor1 = c_orange, _cor2 = c_red, _cor3 = c_white, _out = false)
	{
		//largura da minha barra com base a minha vida atual
		var _larg_vida = (energia_temp/energia_max) * _largura;
		var _larg_vida2 = (energia_fundo/energia_max) * _largura;
		
		var _cor = merge_color(_cor2, _cor1, energia_temp / energia_max);
		
		//diminuindo o valor vida_temp
		energia_temp = lerp(energia_temp, energia, 0.1);
		energia_fundo = lerp(energia_fundo, energia_temp, 0.03)
		
		//desenhando a sub barra de vida
		draw_rectangle_color(_x , _y , _x + _largura, _y + _altura, _cor3, _cor3, _cor3, _cor3, _out)
		
		//barra efeito
		draw_rectangle_color(_x, _y, _x + _larg_vida2, _y + _altura, _cor2, _cor2, _cor2, _cor2, _out)
		
		draw_rectangle_color(_x, _y, _x + _larg_vida, _y + _altura, _cor, _cor, _cor, _cor, _out);
	}
}