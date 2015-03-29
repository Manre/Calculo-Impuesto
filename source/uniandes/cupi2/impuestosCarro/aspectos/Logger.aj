package uniandes.cupi2.impuestosCarro.aspectos;

public aspect Logger {
	
	pointcut logger() : 
		call( * uniandes.cupi2.impuestosCarro.mundo.CalculadorImpuestos.* (..)) || 
		call( * uniandes.cupi2.impuestosCarro.mundo.Linea.* (..)) 				||
		call( * uniandes.cupi2.impuestosCarro.mundo.Marca.* (..)) 				||
		call( * uniandes.cupi2.impuestosCarro.mundo.Modelo.* (..)) 				||
		call( * uniandes.cupi2.impuestosCarro.mundo.RangoImpuesto.* (..)) ;
	
	before(): logger(){
		System.out.println("------------------------BEFORE------------------------");
		System.out.println("Se llamó el procedimiento: " + thisJoinPoint.getSignature().getName());
		System.out.println("Los parámetros de este procedimiento son: ");
		for (Object object:thisJoinPoint.getArgs()){
			System.out.println(".." + object.toString());
		}
		System.out.println("El objeto que está invocando es: " + thisJoinPoint.getTarget().getClass().getName());
	}
	
	after() returning(Object r): logger(){
		
		if (r != null) {
			String nombreMetodo = thisJoinPoint.getSignature().getName();
			String valor= r.toString();
			System.out.println("------------------------AFTER OK------------------------");
			if(nombreMetodo.equals("calcularPago")){
				if (new Double(valor) >= 2000000 ){
					System.out.println("El valor es mayor a 2.000.000, se enviará mail");
					Mail m = new Mail();
				}
				else{
					System.out.println("El valor es menor a 2.000.000");
				}
			}
			System.out.println("El método terminó la ejecución correctamente :: " + r.toString());
		}
	}
	
	after() throwing (Throwable e): logger(){
		if(e != null){
			System.out.println("------------------------AFTER EXCEPTION------------------------");
			System.out.println("El método encontró una excepción :: " + e.getMessage());
		}
	}
}
