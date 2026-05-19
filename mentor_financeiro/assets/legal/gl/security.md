# Seguridade - Mentor Financeiro

**Última actualización:** 19 de maio de 2026

Esta páxina explica as prácticas de seguranza Mentor Financeiro nun idioma sinxelo. Complementa a Política de privacidade e as Condicións de uso.

## 1. Compromiso de seguridade

Mentor Financeiro foi desenvolvido para axudar na organización financeira sen pedir acceso directo á conta bancaria, sen solicitar un contrasinal bancario e sen funcionar como banco, corredor ou método de pago.

A aplicación pode almacenar datos financeiros introducidos por ti ou identificados mediante funcións opcionais, polo que tratamos a seguridade como unha parte central do produto.

## 2. O que a aplicación non fai

- Non pide contrasinal bancaria, tarxeta ou carteira dixital.
- Non accede á súa conta bancaria.
- Non move cartos.
- Non realiza pagos, Pix, transferencias ou investimentos ao seu nome.
- Non solicita código de seguridade da tarxeta.
- Non solicita código bancario OTP.
- Non vende os teus datos persoais.

## 3. Medidas técnicas utilizadas

Dependendo do recurso utilizado, a aplicación pode usar:

- Iniciar sesión por Firebase Authentication.
- Cloud Firestore cos datos asociados ao usuario autenticado.
- Normas de seguridade para restrinxir o acceso aos propios datos do usuario.
- Comunicación cifrada polos SDK e servizos utilizados.
- Firebase Crashlytics para identificar fallos técnicos e solucionar problemas.
- Só se solicitan permisos Android cando están relacionados coas funcións da aplicación.
- Almacenamento local para preferencias, temas, caché e datos do dispositivo.

## 4. Seguimento de notificacións

O seguimento das notificacións é opcional e require a activación manual no Android.

Cando está activada, a aplicación pode ler notificacións compatibles para recoñecer gastos, compras, pagos, subscricións e transferencias. O obxectivo é reducir o traballo manual ao rexistrar os gastos.

Para reducir os riscos:

- A aplicación infórmache do motivo do permiso antes de dirixirte á configuración.
- O acceso pódese revogar en calquera momento na configuración de Android.
- O filtro busca eventos financeiros compatibles, non conversas persoais.
- A aplicación tenta ignorar os códigos OTP, os contrasinais, os códigos de seguridade e as mensaxes de autenticación.
- A aplicación non usa esta función para acceder a bancos, tarxetas ou carteiras dixitais.

Aínda así, as notificacións poden conter datos confidenciais. Use esta función só se acepta este tipo de procesamento.

## 5. Permisos sensibles

A aplicación pode solicitar:

- **Internet:** conexión a Firebase, Google Play, API e recursos en liña.
- **Notificacións:** envío de alertas desde a propia aplicación.
- **Localización:** adaptación de contidos ou comparacións ao país/rexión, cando se autorice.
- **Acceso ás notificacións Android:** identificación opcional de gastos a partir de notificacións compatibles.
- **Compras na aplicación:** Premium subscrición por Google Play.

Controla estes permisos na configuración de Android.

## 6. A túa parte na seguridade

Para protexer os teus datos:

- Usa o bloqueo da pantalla no dispositivo.
- Non compartas a túa conta.
- Mantén a aplicación e Android actualizados.
- Revoga os permisos que xa non queres usar.
- Comproba as transaccións identificadas automaticamente antes de tomar decisións.
- Non rexistre información que non quere conservar na aplicación.
- Cancela as subscricións directamente en Google Play cando non queiras renovar.

## 7. Limitacións

Ningunha aplicación, servidor, sistema operativo ou servizo na nube é 100% seguro. A pesar das medidas adoptadas, poden producirse fallos, indisponibilidade, erros de sincronización, perda de acceso, problemas de terceiros ou intentos de abuso externos.

Mentor Financeiro busca reducir os riscos de forma razoable, pero debe manter copias ou controis propios da información financeira esencial.

## 8. Incidencias e contacto

Se observas un comportamento estraño, acceso inadecuado, datos incorrectos, sospeita de violación da seguridade ou problemas cos permisos confidenciais, ponte en contacto con:

**george.guimares@gmail.com**

Incluír, se é posible:

- Modelo do dispositivo.
- Versión de Android.
- Versión da aplicación.
- Descrición do problema.
- Capturas de pantalla sen expoñer contrasinais, códigos ou datos excesivos.
