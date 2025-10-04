# Focus CRM SaaS — Boilerplate (Laravel 11 + PHP 8.4)

Este pacote entrega **boilerplate + stubs** para um CRM SaaS estilo Kommo, com:
- Multi-tenant (tenant_id), Kanban, Leads, Deals, Webhooks de coleta, Agente de I.A. (OpenAI).
- Docker (nginx + php-fpm 8.4 + mysql 8 + redis) e Makefile.
- Scripts para **gerar** o projeto Laravel automaticamente e **injetar** estes stubs.

> **Observação:** Este boilerplate **não inclui** o núcleo do Laravel. O script `scripts/install.sh` cria um projeto Laravel 11, instala dependências e aplica os stubs.

---

## Requisitos
- Docker + Docker Compose
- Make (opcional, mas recomendado)
- Porta 8080 livre (nginx), 3306 (MySQL), 6379 (Redis)

## Passo a passo rápido
```bash
git clone <seu-repo> focus-crm
cd focus-crm

# 1) Subir containers base
make up

# 2) Gerar Laravel + dependências + stubs (roda dentro do container)
make install

# 3) Gerar key, migrar e seedar
make migrate
make seed

# 4) Acessar
open http://localhost:8080
# login inicial: admin@focuscrm.test / password: password
```

## Principais componentes adicionados pelos stubs
- **Models**: Tenant, Lead, Contact, Company, Pipeline, Stage, Deal, Activity, Note, Message, WebhookEvent, Automation, AIJob, Tag, Product, Proposal, Consent.
- **Controllers (API)**: KanbanController, LeadController, DealController, WebhookController, AIController, ConfigController.
- **Requests**: validações de entrada.
- **Services**: OpenAIService, WebhookIngestor, AutomationEngine.
- **Migrations**: criação das principais tabelas de domínio.
- **Seeders**: `DemoSeeder` com pipeline/estágios/cards de exemplo.
- **routes/api.php**: endpoints REST e webhooks.
- **config/fcrm.php**: opções do tenant, limites e chaves (OpenAI etc.).

## Variáveis .env (exemplo)
Consulte `.env.example` neste repositório.

## Testes
O boilerplate inclui exemplos iniciais de testes (Pest) a serem expandidos.

## Licença
MIT — use, modifique e contribua.
