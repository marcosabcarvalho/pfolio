#!/usr/bin/env bash
set -euo pipefail

############################################
# CONFIG — ajuste aqui conforme preferir
############################################
PROJECT_DIR="pfolio"                     # nome da pasta/local do site
GH_USER="marcosabcarvalho"               # seu usuário do GitHub
EMAIL_PUBLICO="contato@ideiasbits.com.br"
LINKEDIN_SLUG="marcosabcarvalho"         # apenas o slug, sem o /in/ (pode deixar igual)
USE_CUSTOM_DOMAIN=true                   # true = criar arquivo CNAME
CUSTOM_DOMAIN="pfolio.ideiasbits.com.br" # se for usar domínio próprio
INIT_GIT=true                            # true = git init + primeiro commit
CREATE_GITHUB_REMOTE=false               # true = criar remote local (você precisa já ter o repo criado no GitHub)
GITHUB_REPO_NAME="pfolio"                # nome do repositório
############################################

mkdir -p "$PROJECT_DIR"/assets

############################################
# index.html
############################################
cat > "$PROJECT_DIR/index.html" <<EOF
<!doctype html>
<html lang="pt-br">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Portfólio — Cases com Impacto | Marcos A. B. de Carvalho</title>
  <meta name="description" content="Portfólio focado em problemas, soluções e impacto (métricas) para o Hackathon TJBA." />
  <meta name="author" content="Marcos A. B. de Carvalho" />

  <!-- Open Graph -->
  <meta property="og:title" content="Portfólio — Cases com Impacto | Marcos A. B. de Carvalho">
  <meta property="og:description" content="Problema → Solução → Impacto (métricas).">
  <meta property="og:type" content="website">
  <meta property="og:url" content="https://${GH_USER}.github.io/${GITHUB_REPO_NAME}/">
  <meta property="og:image" content="assets/cover.png">

  <link rel="icon" href="assets/favicon.png" type="image/png"/>
  <link rel="stylesheet" href="styles.css" />

  <!-- Schema.org -->
  <script type="application/ld+json">
  {
    "@context":"https://schema.org",
    "@type":"Person",
    "name":"Marcos Antonio Bezerra de Carvalho",
    "url":"https://${GH_USER}.github.io/${GITHUB_REPO_NAME}/",
    "jobTitle":"Analista de TI / Full-stack",
    "alumniOf":{"@type":"CollegeOrUniversity","name":"UNEB"},
    "sameAs":[
      "https://github.com/${GH_USER}",
      "https://www.linkedin.com/in/${LINKEDIN_SLUG}"
    ]
  }
  </script>
</head>
<body>
  <header class="site-header">
    <nav class="wrapper nav">
      <a class="logo" href="#">MAB<span>.</span></a>
      <button id="navToggle" aria-label="abrir menu" class="nav-toggle">☰</button>
      <ul id="navMenu" class="nav-menu">
        <li><a href="#inicio">Início</a></li>
        <li><a href="#cases">Cases</a></li>
        <li><a href="#competencias">Competências</a></li>
        <li><a href="#sobre">Sobre</a></li>
        <li><a href="#contato">Contato</a></li>
        <li><a href="#" id="btnPrint">PDF 1 pág.</a></li>
      </ul>
    </nav>
  </header>

  <main id="inicio" class="hero hero--cases">
    <div class="wrapper hero-grid">
      <div class="hero-copy">
        <h1>Portfólio de Impacto</h1>
        <p class="lead">
          Marcos A. B. de Carvalho — Full-stack (Angular • Spring Boot • Docker) e Maker (ESP32/Arduino).
          Abaixo, cases do setor público e educacional no formato <b>Problema → Solução → Impacto</b>.
        </p>
        <div class="badges">
          <span class="badge">Hackathon TJBA</span>
          <span class="badge badge-alt">GovTech</span>
          <span class="badge badge-alt">DevOps</span>
        </div>
        <div class="cta">
          <a class="btn" href="#cases">Ver cases</a>
          <a class="btn btn-ghost" href="#contato">Falar comigo</a>
        </div>
      </div>
      <div class="hero-card">
        <div class="stat"><span class="stat-k">+10</span><span class="stat-label">anos em TI pública</span></div>
        <div class="stat"><span class="stat-k">+25</span><span class="stat-label">projetos & POCs</span></div>
        <div class="stat"><span class="stat-k">Docker</span><span class="stat-label">deploys reproducíveis</span></div>
      </div>
    </div>
  </main>

  <section id="cases" class="section">
    <div class="wrapper">
      <h2>Cases (Problema → Solução → Impacto)</h2>
      <p class="section-lead">Seleção de casos com foco em resultado mensurável. Clique para expandir detalhes ou abrir repositório.</p>
      <div id="casesGrid" class="grid"></div>
      <div class="more">
        <a class="btn btn-ghost" href="https://github.com/${GH_USER}" target="_blank" rel="noopener">Mais no GitHub →</a>
      </div>
    </div>
  </section>

  <section id="competencias" class="section alt">
    <div class="wrapper">
      <h2>Competências</h2>
      <div class="skills-grid">
        <div>
          <h3>Back-end</h3>
          <ul>
            <li>Java • Spring Boot • JPA • Security</li>
            <li>Python (APIs, automações)</li>
            <li>REST • JWT • Webhook</li>
            <li>PostgreSQL • MySQL</li>
          </ul>
        </div>
        <div>
          <h3>Front-end</h3>
          <ul>
            <li>Angular • TypeScript</li>
            <li>HTML5 • CSS (Flex/Grid)</li>
            <li>A11y • Performance</li>
          </ul>
        </div>
        <div>
          <h3>DevOps</h3>
          <ul>
            <li>Docker • Compose • GitHub Actions</li>
            <li>Nginx • TLS (Let's Encrypt)</li>
            <li>Observabilidade básica</li>
          </ul>
        </div>
        <div>
          <h3>Maker/IoT</h3>
          <ul>
            <li>ESP32/Arduino • I2S/Áudio</li>
            <li>Visão computacional (POCs)</li>
          </ul>
        </div>
      </div>
    </div>
  </section>

  <section id="sobre" class="section">
    <div class="wrapper">
      <h2>Sobre</h2>
      <p>
        Atuo com desenvolvimento full-stack no setor público, priorizando segurança, estabilidade e UX.
        Experiência com Angular + Spring Boot, automações Python e pipelines Docker/Nginx com TLS.
        Em projetos maker, integro ESP32/Arduino para educação e música.
      </p>
    </div>
  </section>

  <section id="contato" class="section alt">
    <div class="wrapper">
      <h2>Contato</h2>
      <p>Para oportunidades e parcerias, entre em contato por e-mail ou redes.</p>
      <div class="contact-cards">
        <a class="card" href="mailto:${EMAIL_PUBLICO}">
          <strong>Email</strong><span>${EMAIL_PUBLICO}</span>
        </a>
        <a class="card" href="https://github.com/${GH_USER}" target="_blank" rel="noopener">
          <strong>GitHub</strong><span>github.com/${GH_USER}</span>
        </a>
        <a class="card" href="https://www.linkedin.com/in/${LINKEDIN_SLUG}" target="_blank" rel="noopener">
          <strong>LinkedIn</strong><span>linkedin.com/in/${LINKEDIN_SLUG}</span>
        </a>
      </div>
    </div>
  </section>

  <footer class="site-footer no-print">
    <div class="wrapper">
      <small>© <span id="year"></span> Marcos A. B. de Carvalho — Portfólio</small>
    </div>
  </footer>

  <script src="script.js"></script>
</body>
</html>
EOF

############################################
# styles.css
############################################
cat > "$PROJECT_DIR/styles.css" <<'EOF'
:root{
  --bg:#0b0e12;
  --card:#12171f;
  --muted:#9fb1c5;
  --text:#e8eef6;
  --brand:#3b82f6;
  --brand-2:#64748b;
  --ok:#22c55e;
  --shadow: 0 6px 30px rgba(0,0,0,.35);
}

*{box-sizing:border-box}
html,body{margin:0;padding:0;background:var(--bg);color:var(--text);font:16px/1.6 system-ui,-apple-system,Segoe UI,Inter,Roboto,Ubuntu,Arial,sans-serif}
img{max-width:100%;display:block}
a{color:var(--brand);text-decoration:none}
a:hover{text-decoration:underline}
.wrapper{width:min(1100px,92%);margin-inline:auto}
.section{padding:64px 0}
.section.alt{background:linear-gradient(180deg, rgba(255,255,255,0.02), rgba(255,255,255,0.00))}
.section h2{margin:0 0 12px;font-size:clamp(1.6rem,2.2vw,2rem)}
.section-lead{color:var(--muted);margin-bottom:22px}

/* header/nav */
.site-header{position:sticky;top:0;z-index:10;background:rgba(11,14,18,.7);backdrop-filter:saturate(150%) blur(10px);border-bottom:1px solid rgba(255,255,255,.06)}
.nav{display:flex;align-items:center;justify-content:space-between;gap:16px;min-height:56px}
.logo{font-weight:800;letter-spacing:.5px}
.logo span{color:var(--brand)}
.nav-menu{display:flex;gap:18px;list-style:none;margin:0;padding:0}
.nav-menu a{padding:8px 10px;border-radius:10px}
.nav-menu a:hover{background:rgba(255,255,255,.06);text-decoration:none}
.nav-toggle{display:none;background:none;border:none;color:var(--text);font-size:22px}

/* hero */
.hero{padding:60px 0 40px;background:
 radial-gradient(1000px 600px at 85% -10%, rgba(59,130,246,.25), transparent 60%),
 radial-gradient(800px 400px at -10% 0%, rgba(255,255,255,.06), transparent 60%)}
.hero--cases{padding-bottom:20px}
.hero-grid{display:grid;grid-template-columns:1.2fr .8fr;gap:28px;align-items:stretch}
.hero-copy h1{margin:0 0 10px;font-size:clamp(1.8rem,3.5vw,2.6rem)}
.lead{color:#cfe0f7;max-width:60ch}
.badges{display:flex;gap:10px;flex-wrap:wrap;margin:18px 0}
.badge{background:var(--brand);color:#fff;padding:6px 10px;border-radius:999px;font-size:.85rem;box-shadow:var(--shadow)}
.badge-alt{background:#1f2937}
.cta{display:flex;gap:12px;margin-top:16px}
.btn{display:inline-block;background:var(--brand);color:#fff;padding:10px 16px;border-radius:12px;font-weight:600;box-shadow:var(--shadow)}
.btn:hover{opacity:.95;text-decoration:none}
.btn-ghost{background:transparent;border:1px solid rgba(255,255,255,.15)}
.btn-ghost:hover{background:rgba(255,255,255,.07)}
.hero-card{background:var(--card);border:1px solid rgba(255,255,255,.08);border-radius:16px;padding:18px;display:grid;gap:14px;align-content:center;box-shadow:var(--shadow)}
.stat{display:flex;flex-direction:column}
.stat-k{font-size:1.6rem;font-weight:800}
.stat-label{color:var(--muted);font-size:.95rem}

/* grid/cards */
.grid{display:grid;grid-template-columns:repeat(3,1fr);gap:18px}
.card{background:var(--card);border:1px solid rgba(255,255,255,.08);border-radius:14px;padding:16px;box-shadow:var(--shadow);display:flex;flex-direction:column;gap:10px}
.card h3{margin:0 0 6px;font-size:1.05rem}
.card p{margin:0;color:var(--muted)}
.card .tags{display:flex;gap:8px;flex-wrap:wrap;margin-top:6px}
.tag{font-size:.78rem;color:#d1e2ff;background:#0f172a;padding:4px 8px;border-radius:999px}
.card .pill{display:inline-flex;align-items:center;gap:6px;font-size:.78rem;background:#0f172a;border:1px solid rgba(255,255,255,.08);border-radius:999px;padding:3px 8px;color:#cfe0f7}
.card .pill .dot{width:8px;height:8px;border-radius:50%;background:var(--ok)}

/* accordion */
.case-body{display:none;border-top:1px dashed rgba(255,255,255,.12);padding-top:10px}
.case-body.show{display:block}
.case-section h4{margin:8px 0 6px;font-size:.95rem}
.case-section p{margin:0 0 8px}
.case-metrics{display:grid;grid-template-columns:repeat(3,1fr);gap:10px;margin-top:6px}
.metric{background:#0f172a;border:1px solid rgba(255,255,255,.06);border-radius:12px;padding:10px}
.metric b{display:block;font-size:1.1rem}

/* skills, contato, footer */
.skills-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:18px}
.skills-grid h3{margin:0 0 8px}
.skills-grid ul{margin:0;padding-left:18px;color:var(--muted)}
.contact-cards{display:grid;grid-template-columns:repeat(3,1fr);gap:14px}
.contact-cards .card strong{display:block}
.contact-cards .card span{color:var(--muted);font-size:.95rem}
.site-footer{border-top:1px solid rgba(255,255,255,.08);padding:16px 0;color:var(--brand-2);text-align:center}

/* responsivo */
@media (max-width: 980px){
  .hero-grid{grid-template-columns:1fr}
  .grid{grid-template-columns:repeat(2,1fr)}
  .skills-grid{grid-template-columns:repeat(2,1fr)}
  .contact-cards{grid-template-columns:1fr}
  .nav-toggle{display:block}
  .nav-menu{display:none;flex-direction:column;background:rgba(15,23,42,.98);position:absolute;right:4%;top:56px;padding:12px;border:1px solid rgba(255,255,255,.08);border-radius:12px}
  .nav-menu.show{display:flex}
}
@media (max-width: 560px){ .grid{grid-template-columns:1fr} }

/* impressão: 1 página limpa */
@media print{
  :root{--bg:#fff;--text:#000}
  *{color:var(--text)!important}
  .site-header,.no-print,.nav,.btn,.badges,.cta,.more{display:none!important}
  body{background:#fff}
  .section{padding:20px 0}
  .hero{padding:0;background:none}
  .hero-card{border:1px solid #ddd}
  .grid{grid-template-columns:1fr 1fr;gap:12px}
  .card{border:1px solid #ddd;box-shadow:none}
}
EOF

############################################
# script.js
############################################
cat > "$PROJECT_DIR/script.js" <<'EOF'
// Menu mobile
const navToggle = document.getElementById('navToggle');
const navMenu = document.getElementById('navMenu');
navToggle?.addEventListener('click', () => navMenu.classList.toggle('show'));

// Ano no rodapé
document.getElementById('year') && (document.getElementById('year').textContent = new Date().getFullYear());

// Botão imprimir (gera PDF 1 página via print-to-PDF do navegador)
document.getElementById('btnPrint')?.addEventListener('click', (e) => {
  e.preventDefault();
  window.print();
});

// ===== Cases (Problema → Solução → Impacto) =====
const cases = [
  {
    title: "Controle de Ponto — Setor Público",
    context: "Gov • Angular + Spring Boot • PDF • Nginx/TLS",
    tags: ["Angular","Spring Boot","Docker","Nginx","PDF"],
    problema: "Lançamentos de frequência dispersos, baixa auditoria e geração manual de relatórios.",
    solucao: "Aplicação full-stack (Angular + Spring Boot) com relatórios PDF (jsPDF/Jasper), autenticação e proxy Nginx, deploy Docker.",
    impacto: [
      { k: "−65%", label: "tempo p/ gerar relatórios" },
      { k: "100%", label: "tráfego sob HTTPS" },
      { k: "CI/CD", label: "pipeline GitHub Actions" }
    ],
    link: "https://github.com/marcosabcarvalho/controledeponto-frontend"
  },
  {
    title: "Reconhecimento Facial — Acesso Interno (POC)",
    context: "Python + dlib • PKL incremental • Automação",
    tags: ["Python","Visão","Automação","dlib"],
    problema: "Onboarding manual e sujeito a falhas para atualizar rostos autorizados.",
    solucao: "Pipeline Python com dlib, geração incremental do PKL e script de automação (SCP/SSH/systemd) para atualizar produção com um comando.",
    impacto: [
      { k: "−80%", label: "esforço de cadastro contínuo" },
      { k: "1 cmd", label: "atualização remota do serviço" },
      { k: "Logs", label: "rastreamento/rollback simples" }
    ],
    link: "https://github.com/marcosabcarvalho"
  },
  {
    title: "Sonotrig — EdTech (ESP32)",
    context: "Hardware didático • I2S/Áudio • Sequência didática",
    tags: ["ESP32","Educação","Áudio"],
    problema: "Dificuldade de visualizar ondas e relações trigonométricas em aulas tradicionais.",
    solucao: "Dispositivo ESP32 com geração/visualização de formas de onda e material didático alinhado à BNCC; prototipagem rápida.",
    impacto: [
      { k: "+↑", label: "engajamento em sala" },
      { k: "−40%", label: "tempo p/ fixar conceitos" },
      { k: "Open", label: "base reutilizável p/ escolas" }
    ],
    link: "https://github.com/marcosabcarvalho"
  },
  {
    title: "PWA Rádio Retrô",
    context: "JS/PWA • UI temática • Edge caching",
    tags: ["PWA","JS","UI"],
    problema: "Interfaces de streaming pouco amigáveis e sem identidade.",
    solucao: "SPA leve com PWA, dial retrô e presets; otimizações de rede e UX.",
    impacto: [
      { k: "LCP<2s", label: "carregamento em 4G" },
      { k: "↑", label: "retenção de sessão" },
      { k: "Cross", label: "desktop/mobile" }
    ],
    link: "https://github.com/marcosabcarvalho/estacao-saudade"
  },
  {
    title: "Intercâmbio Virtual — Inglês",
    context: "Chat c/ TTS/STT • verificação de fala",
    tags: ["Python","TTS","STT","Edu"],
    problema: "Bloqueio de pronúncia e baixa repetição guiada dos alunos.",
    solucao: "Chat com TTS/STT, checagem de pronúncia e feedback imediato; prática por etapas.",
    impacto: [
      { k: "x3", label: "repetições por sessão" },
      { k: "↑", label: "conversa contínua (flow)" },
      { k: "→", label: "transcrição p/ revisão" }
    ],
    link: "https://github.com/marcosabcarvalho"
  },
  {
    title: "GeoCanudos — Cultura",
    context: "Flutter • Assets (fotos/vídeos) • Curadoria",
    tags: ["Flutter","Cultura","UX"],
    problema: "Acervo rico, porém desorganizado e sem contexto geográfico/histórico padronizado.",
    solucao: "App com metadados simples (título, descrição, local, mídia) e fluxo de curadoria para evitar informações desencontradas.",
    impacto: [
      { k: "Consist.", label: "narrativa visual/histórica" },
      { k: "↓ retrabalho", label: "edição/validação" },
      { k: "Share", label: "divulgação facilitada" }
    ],
    link: "https://github.com/marcosabcarvalho"
  }
];

function makeCaseCard(c){
  const el = document.createElement('article');
  el.className = 'card';

  const tagsHtml = c.tags.map(t => `<span class="tag">${t}</span>`).join(' ');
  const metricsHtml = c.impacto.map(m => `
    <div class="metric"><b>${m.k}</b><span>${m.label}</span></div>`).join('');

  el.innerHTML = `
    <div class="pill"><span class="dot"></span><span>${c.context}</span></div>
    <h3>${c.title}</h3>
    <div class="tags">${tagsHtml}</div>

    <div class="case-body">
      <div class="case-section">
        <h4>Problema</h4>
        <p>${c.problema}</p>
      </div>
      <div class="case-section">
        <h4>Solução</h4>
        <p>${c.solucao}</p>
      </div>
      <div class="case-section">
        <h4>Impacto (métricas)</h4>
        <div class="case-metrics">${metricsHtml}</div>
      </div>
      <div style="margin-top:10px">
        <a class="btn btn-ghost" href="${c.link}" target="_blank" rel="noopener">Abrir repositório →</a>
      </div>
    </div>

    <div style="display:flex;gap:10px;margin-top:6px">
      <button class="btn btn-ghost btn-toggle">Ver detalhes</button>
      <a class="btn" href="${c.link}" target="_blank" rel="noopener">Repo</a>
    </div>
  `;

  const body = el.querySelector('.case-body');
  el.querySelector('.btn-toggle').addEventListener('click', () => {
    body.classList.toggle('show');
  });

  return el;
}

const grid = document.getElementById('casesGrid');
if (grid) cases.forEach(c => grid.appendChild(makeCaseCard(c)));
EOF

############################################
# assets placeholders
############################################
# Coloca ícones/placeholder simples para não quebrar referências
convert -size 512x512 canvas:"#0b0e12" "$PROJECT_DIR/assets/cover.png" 2>/dev/null || true
convert -size 64x64   canvas:"#0b0e12" "$PROJECT_DIR/assets/favicon.png" 2>/dev/null || true

############################################
# CNAME (opcional)
############################################
if [ "$USE_CUSTOM_DOMAIN" = true ]; then
  echo "$CUSTOM_DOMAIN" > "$PROJECT_DIR/CNAME"
  echo "✔ Criado CNAME com domínio: $CUSTOM_DOMAIN"
fi

############################################
# Git init (opcional)
############################################
if [ "$INIT_GIT" = true ]; then
  (
    cd "$PROJECT_DIR"
    git init -b main
    git add .
    git commit -m "feat: portfólio (cases com impacto) — inicial"
    if [ "$CREATE_GITHUB_REMOTE" = true ]; then
      git remote add origin "git@github.com:${GH_USER}/${GITHUB_REPO_NAME}.git" || true
      echo "✔ Remote configurado: git@github.com:${GH_USER}/${GITHUB_REPO_NAME}.git"
      echo "→ Agora rode:  cd $PROJECT_DIR && git push -u origin main"
    fi
  )
fi

echo "----------------------------------------"
echo "Pronto! Arquivos gerados em: $PROJECT_DIR"
echo "Para publicar no GitHub Pages:"
echo "  1) Crie o repositório ${GITHUB_REPO_NAME} no GitHub (${GH_USER})."
echo "  2) cd $PROJECT_DIR"
echo "  3) git remote add origin git@github.com:${GH_USER}/${GITHUB_REPO_NAME}.git"
echo "  4) git push -u origin main"
echo "  5) No GitHub: Settings → Pages → Branch: main → /(root)."
if [ "$USE_CUSTOM_DOMAIN" = true ]; then
  echo "  6) No Registro.br: crie um CNAME para ${CUSTOM_DOMAIN} → ${GH_USER}.github.io"
fi
echo "----------------------------------------"
