# 🚀 SAP ABAP Cloud Journey — Proyecto 1: CRUD con RAP

> Parte de mi hoja de ruta pública de 0 a experto en SAP ABAP Cloud y BTP.

## 📋 Descripción

Aplicación Fiori Elements completa con operaciones CRUD (Create, Read, Update, Delete) construida desde cero usando el **ABAP RESTful Application Programming Model (RAP)** sobre un sistema S/4HANA real.

Sin tocar una línea de JavaScript. Sin arrastrar un solo botón. Solo código ABAP.

---

## 🏗️ Arquitectura

```
┌─────────────────────────────────────────────┐
│           App Fiori Elements (UI)            │
│         Generada automáticamente             │
└─────────────────┬───────────────────────────┘
                  │ OData V2
┌─────────────────▼───────────────────────────┐
│         Service Binding (ZSB_TRAVELS_V2)     │
│              OData V2 - UI                   │
└─────────────────┬───────────────────────────┘
                  │
┌─────────────────▼───────────────────────────┐
│        Service Definition (ZSD_TRAVELS)      │
│         Expone ZC_TRAVELS como Travel        │
└─────────────────┬───────────────────────────┘
                  │
┌─────────────────▼───────────────────────────┐
│      CDS Projection View (ZC_TRAVELS)        │
│   Anotaciones @UI para lista y formulario    │
└─────────────────┬───────────────────────────┘
                  │
┌─────────────────▼───────────────────────────┐
│      CDS Interface View (ZI_TRAVELS)         │
│         Modelo de datos base                 │
└─────────────────┬───────────────────────────┘
                  │
┌─────────────────▼───────────────────────────┐
│      Tabla de base de datos (ZDEMO_TRAVELS)  │
│         Persistent Table en S/4HANA          │
└─────────────────────────────────────────────┘
```

---

## 📁 Objetos ABAP creados

| Objeto | Tipo | Descripción |
|--------|------|-------------|
| `ZDEMO_TRAVELS` | Database Table | Tabla de persistencia con campos de negocio y administración |
| `ZI_TRAVELS` | CDS Root View Entity | Interface View — modelo de datos base |
| `ZC_TRAVELS` | CDS Projection View | Projection View con anotaciones @UI para Fiori |
| `ZI_TRAVELS` | Behavior Definition | BDEF managed con create, update, delete y ETag |
| `ZC_TRAVELS` | Behavior Definition | BDEF de projection que expone las operaciones |
| `ZBP_I_TRAVELS` | Behavior Implementation Class | Clase de implementación con autorización global |
| `ZSD_TRAVELS` | Service Definition | Expone ZC_TRAVELS como entidad Travel |
| `ZSB_TRAVELS_V2` | Service Binding | OData V2 UI — endpoint REST de la app |

---

## 🗄️ Modelo de datos

### Tabla `ZDEMO_TRAVELS`

| Campo | Tipo | Descripción |
|-------|------|-------------|
| `client` | `mandt` | Mandante SAP (clave) |
| `travel_id` | `sysuuid_x16` | UUID generado por RAP (clave) |
| `description` | `abap.char(100)` | Descripción del viaje |
| `status` | `abap.char(1)` | O=Open, A=Accepted, X=Cancelled |
| `begin_date` | `abap.dats` | Fecha de inicio |
| `end_date` | `abap.dats` | Fecha de fin |
| `total_price` | `abap.curr(16,2)` | Precio total |
| `booking_fee` | `abap.curr(16,2)` | Tarifa de reserva |
| `currency_code` | `waers` | Moneda (EUR, USD...) |
| `created_by` | `syuname` | Usuario de creación (auto) |
| `created_at` | `timestampl` | Timestamp de creación (auto) |
| `last_changed_by` | `syuname` | Usuario de modificación (auto) |
| `last_changed_at` | `timestampl` | ETag para optimistic locking (auto) |
| `local_last_changed_at` | `timestampl` | Timestamp local (auto) |

---

## ⚙️ Conceptos clave aprendidos

**RAP Managed Scenario** — El framework gestiona automáticamente la persistencia en base de datos. Defines QUÉ hace el sistema, no CÓMO lo persiste.

**Interface View vs Projection View** — La Interface View es el modelo de datos base sin anotaciones de UI. La Projection View es lo que ve el usuario final, con anotaciones `@UI` que controlan el layout de Fiori automáticamente.

**ETag con `LastChangedAt`** — Mecanismo de optimistic locking. Si dos usuarios editan el mismo registro a la vez, RAP detecta el conflicto y avisa al segundo antes de sobreescribir.

**UUID como clave técnica** — En ABAP Cloud se usa `sysuuid_x16` en vez de number ranges secuenciales. RAP genera el UUID automáticamente con early numbering.

**OData V2 vs V4 en RAP** — Para servicios RAP managed sin draft se usa OData V2. OData V4 está recomendado para servicios con draft capability habilitado.

**`@UI.lineItem`** — Controla qué campos aparecen en la lista y en qué posición.

**`@UI.identification`** — Controla qué campos aparecen en el formulario de detalle/edición.

**`@UI.selectionField`** — Añade un campo como filtro en la barra de búsqueda.

---

## 🎯 Resultado final

- ✅ Lista de viajes con columnas configuradas via `@UI.lineItem`
- ✅ Filtro por Status via `@UI.selectionField`
- ✅ Formulario de creación con todos los campos
- ✅ Formulario de edición con detalle completo
- ✅ Borrado de registros
- ✅ Importes con moneda formateados automáticamente
- ✅ Date picker automático para fechas

---

## 🛠️ Sistema utilizado

- **Sistema:** S/4HANA (cuenta training Experis España)
- **IDE:** Eclipse con ABAP Development Tools (ADT)
- **ABAP mode:** ABAP Cloud (Clean Core)
- **Control de versiones:** abapGit → GitHub

---

## 📚 Próximos proyectos

- **Proyecto 2:** Validaciones, determinaciones y acciones de negocio en RAP
- **Proyecto 3:** RAP unmanaged sobre tablas estándar de S/4HANA
- **Proyecto 4:** CDS Views avanzadas con asociaciones y anotaciones analíticas
- **Proyecto 5:** Released APIs de S/4 desde ABAP Cloud — Clean Core real

---

## 👩‍💻 Autora

María Dolores Moreno — aprendiendo SAP ABAP Cloud y BTP en público.

[LinkedIn](https://www.linkedin.com/in/maria-dolores-moreno-cabrera-194983151/) · [GitHub](https://github.com/mmoreno-byte)

---

*Este repositorio forma parte de mi hoja de ruta pública de 0 a experto en SAP ABAP Cloud y BTP.*
