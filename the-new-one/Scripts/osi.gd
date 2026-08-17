extends CharacterBody3D

@export var gravedad:float = 9.8
@export var velocidad:float = 100.0
@export var sensibilidad:int = 10

var rotacion = 0.0

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotacion -= event.relative.y * sensibilidad
		rotacion = clamp(rotacion,-90,90)
		rotation_degrees.y -= event.relative.x * sensibilidad
		rotation_degrees.x = rotacion

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	var direccion = Vector3.ZERO
	
	if Input.is_action_pressed("Adelante"):
		direccion -= transform.basis.z
	if Input.is_action_pressed("Atras"):
		direccion += transform.basis.z
	if Input.is_action_pressed("Derecha"):
		direccion += transform.basis.x
	if Input.is_action_pressed("Izquierda"):
		direccion -= transform.basis.x
	
	velocity.x = direccion.x * velocidad * delta
	velocity.z = direccion.z * velocidad * delta
	move_and_slide()
