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
// Regras pedidas: todos os links apontam para o perfil do GitHub,
// exceto Controle de Ponto, que aponta para https://app.trf1.jus.br/controleponto
const GITHUB_PROFILE = "https://github.com/marcosabcarvalho";

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
    link: "https://app.trf1.jus.br/controleponto"
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
    link: GITHUB_PROFILE
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
    link: GITHUB_PROFILE
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
    link: GITHUB_PROFILE
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
    link: GITHUB_PROFILE
  },
  {
    title: "GeoCanudos — Cultura",
    context: "Flutter • Assets (fotos/vídeos) • Curadoria",
    tags: ["Flutter","Cultura","UX"],
    problema: "Acervo rico, porém desorganizado e sem contexto geográfico/histórico padronizado.",
    solucao: "App com metadados simples (título, descrição, local, média) e fluxo de curadoria para evitar informações desencontradas.",
    impacto: [
      { k: "Consist.", label: "narrativa visual/histórica" },
      { k: "↓ retrabalho", label: "edição/validação" },
      { k: "Share", label: "divulgação facilitada" }
    ],
    link: GITHUB_PROFILE
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
