extends RayCast3D

@onready var texto = $Label

func _ready() -> void:
	add_exception(owner)

func _physics_process(delta: float) -> void:
	texto.text = ""
	if is_colliding():
		var deteccion = get_collider()
		
		if deteccion.is_in_group("Puertas_Comunes"):
			texto.text = deteccion.mensaje
			if Input.is_action_pressed("Interactuar"):
				deteccion.Interaccion()
