extends Resource
class_name MissionData
@export var nombre_mision: String
@export var descripcion: String
@export var nivel_dificultad: int
@export var estacion_asignada: String
@export var pasos: Array[String]  # Cada paso puede ser una instrucción o interacción
@export var requisitos_previos: Array[String] # IDs o nombres de misiones necesarias antes
