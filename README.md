# ficiber-infra

Infraestructura como código y configuración de despliegue de la plataforma
**Ficiber Analytics** (API, workers y servicios internos).

> **Nota académica.** Este repositorio pertenece a un **entorno de laboratorio**
> para un Trabajo Fin de Máster (Máster Universitario en Ciberseguridad, UNIR).
> La empresa *Ficiber* es **ficticia** y las credenciales que aparecen son
> **falsas y no funcionales**. No apuntan a ningún sistema real.

## Arquitectura

La plataforma corre sobre **Kubernetes (AWS EKS)** y se aprovisiona con **Terraform**.
Los pipelines de despliegue se ejecutan en `jenkins.ficiber.com` y la observabilidad
se centraliza en `grafana.ficiber.com`.

| Componente | Servicio | Host |
|---|---|---|
| API | ficiber/api | api.ficiber.com |
| Aplicación | ficiber/web | app.ficiber.com |
| Base de datos | PostgreSQL 14 | db.internal.ficiber.com |
| Caché | Redis 6 | cache.internal.ficiber.com |
| SSO | Keycloak 18 | sso.ficiber.com |
| Observabilidad | Grafana 8.3.0 | grafana.ficiber.com |
| CI/CD | Jenkins 2.346.1 | jenkins.ficiber.com |
| Secretos | HashiCorp Vault | vault.internal.ficiber.com |

## Puesta en marcha (local)

```bash
cp config/production.env .env
docker compose up -d
```

## Despliegue

El despliegue a producción lo dispara Jenkins tras el merge a `main`.
Contacto del equipo de plataforma: **carlos.vega@ficiber.com**.
