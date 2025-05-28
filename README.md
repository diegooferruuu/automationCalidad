# Swag Labs - Exploratory and Automated Testing

## Exploratory Testing  
*Swag Labs* es una aplicación web enfocada en simular un flujo de compra en línea con diferentes niveles de complejidad en sus funcionalidades.

Este proyecto tiene como propósito analizar la aplicación desde la perspectiva del usuario mediante pruebas exploratorias, identificando comportamientos esperados, errores y oportunidades de mejora.

## Objetivo del Proyecto  
Realizar pruebas exploratorias sistemáticas para identificar módulos clave, funcionalidades críticas y posibles errores que impacten la experiencia del usuario. Asimismo, se establece la base para pruebas automatizadas que garanticen una validación continua y eficaz.

## Módulos Identificados
Durante el proceso de testing exploratorio, se identificaron los siguientes módulos clave:

- **Login**: Validación de credenciales y control de acceso.
- **Products (Catálogo)**: Visualización y filtrado de productos.
- **Filters**: Ordenamiento por nombre y precio.
- **Product Detail**: Interacción con productos individuales.
- **Shopping Cart**: Visualización y edición del carrito.
- **Checkout**: Flujo de compra en tres pasos.
- **Navigation Menu**: Menú lateral con opciones de navegación y control de estado.
- **Footer Links**: Redirección a redes sociales externas.
- **Redirecciones**: Verificación de rutas permitidas y control de sesión.

## Tecnologías y Herramientas  
- **Pruebas Exploratorias**: Exploratory Testing Chrome Extension.
- **Pruebas Automatizadas**:  
  - Lenguaje : Ruby 
  - Frameworks recomendados: Gherkin, Cucumber, Capybara   

## Comandos de Ejecución  
> En caso de que se incorporen pruebas automatizadas con Cucumber:

```bash
# Ejecutar un feature específico
cucumber features/<nombre_del_feature>.feature

# Generar un reporte en HTML
cucumber -f html -o report.html
