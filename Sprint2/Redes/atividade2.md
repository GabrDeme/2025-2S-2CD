# 🌐 Atividade 2 — Captura de Credenciais em HTTP com Wireshark

## 🎯 Objetivo

O objetivo desta atividade é **demonstrar a transmissão de credenciais em texto claro** utilizando o protocolo **HTTP**, analisando o tráfego capturado no **Wireshark**.  
Em seguida, comparar o comportamento com o uso do **HTTPS**, entendendo como a **criptografia protege os dados sensíveis**.

---

## 🧩 Conteúdos estudados

Nesta atividade, aplicamos conceitos fundamentais de **segurança de rede e análise de pacotes**, incluindo:

| Conceito | Descrição |
|-----------|------------|
| **Modelo TCP/IP** | Estrutura de camadas usada para comunicação em redes. |
| **Protocolo HTTP/HTTPS** | HTTP transmite dados em texto claro; HTTPS utiliza criptografia via TLS. |
| **Wireshark** | Ferramenta para capturar e analisar pacotes de rede. |
| **Segurança da informação** | Práticas para proteger credenciais e dados sensíveis em trânsito. |

---

### 1. Camada 2 — Enlace (Ethernet)

- **Função:** Entregar quadros dentro da mesma rede local.  
- **Protocolo:** Ethernet II  
- **Campos observados:**  
  - Endereço MAC de origem: `00:0c:29:6b:23:19`  
  - Endereço MAC de destino: `00:50:56:f6:f1:a8`  

💡 *O endereço MAC identifica fisicamente os dispositivos dentro da rede local.*

---

### 2. Camada 3 — Rede (IPv4)

- **Função:** Endereçamento lógico e roteamento de pacotes.  
- **Protocolo:** IPv4  
- **Campos observados:**  
  - Endereço IP de origem: `192.168.30.128`  
  - Endereço IP de destino: `44.228.249.3`  

💡 *O IP de origem representa o host local, enquanto o IP de destino é o servidor do site acessado.*

---

### 3. Camada 4 — Transporte (TCP)

- **Função:** Garantir a comunicação confiável entre cliente e servidor.  
- **Protocolo:** TCP  
- **Campos observados:**  
  - Porta de origem: `40172`  
  - Porta de destino: `80`  
  - Flags TCP: `PSH, ACK (0x018)`  
  - Número de sequência (Sequence Number): `3801263322`  

💡 *A porta 80 indica que a comunicação ocorre via HTTP (sem criptografia).*

---

### 4. Camada 7 — Aplicação (HTTP)

- **Função:** Comunicação entre o navegador e o servidor web.  
- **Protocolo:** HTTP  
- **Campos observados:**  
  - Método HTTP: `POST`  
  - Host: `testphp.vulnweb.com`  
  - User-Agent: `Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101 Firefox/128.0`  
  - Content-Type: `application/x-www-form-urlencoded`  
  - Content-Length: `20`  
  - Corpo do POST:  
    ```
    uname=test&pass=test
    ```

💡 *Aqui é possível visualizar o nome de usuário e a senha em texto claro, evidenciando a falta de criptografia.*

---

## 🧠 **Respostas às Questões**

### 🔹 Em qual camada do modelo TCP/IP a senha aparece?
A senha aparece na **Camada 7 (Aplicação)**.  
Nesta camada, o HTTP transmite as informações do formulário (username e password) diretamente no corpo da requisição.

---

### 🔹 Compare com `https://testphp.vulnweb.com/` — o que muda e por quê?
Ao acessar via **HTTPS**, os dados trafegam **criptografados** através do protocolo **TLS**, impedindo a leitura do conteúdo da requisição (como a senha).  
O Wireshark não consegue exibir o conteúdo do POST, pois ele é protegido pela criptografia de ponta a ponta.

💡 *HTTPS é essencial para proteger credenciais e garantir a privacidade do usuário.*

---

## 🧱 Medidas para proteger credenciais em trânsito

| Medida | Descrição |
|:--|:--|
| **TLS (HTTPS)** | Criptografa os dados enviados entre o navegador e o servidor. |
| **HSTS (HTTP Strict Transport Security)** | Obriga o uso de HTTPS, impedindo o downgrade para HTTP. |
| **Cookies Secure/HttpOnly** | Protegem cookies de sessão contra roubo ou injeção de scripts. |
| **MFA (Autenticação Multifatorial)** | Exige mais de um fator de autenticação além da senha. |

💡 *Essas práticas garantem maior segurança e reduzem a chance de interceptação de dados.*

---

## 💡 **Observações Finais**

- O protocolo **HTTP** transmite dados em **texto claro**, o que permite que credenciais sejam vistas em capturas de rede.  
- Com o uso de **HTTPS (TLS)**, esse risco é eliminado, pois o tráfego é criptografado.  
- Essa análise reforça a importância do **uso de conexões seguras** e da **camada de aplicação** no modelo TCP/IP.  
- O **Wireshark** é uma ferramenta poderosa para compreender o funcionamento real das comunicações em rede.
