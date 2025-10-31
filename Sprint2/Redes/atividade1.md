# 🌐 Atividade 1 — Análise de Pacote de Rede com Wireshark

## 🎯 Objetivo

O objetivo desta atividade é **analisar um pacote HTTP POST** no Wireshark, identificar os campos correspondentes em cada camada do modelo OSI (Enlace, Rede, Transporte e Aplicação) e entender o **fluxo de dados em uma rede**.  

O arquivo utilizado é: `lab_activity1.pcap`, contendo um único frame Ethernet com pacote IPv4/TCP e requisição HTTP POST com credenciais de exemplo.

---

## 🧩 Conteúdos estudados

Nesta atividade, revisamos e aplicamos conceitos de **Redes de Computadores**, incluindo:

### 1. Modelo OSI (Open Systems Interconnection)
O modelo OSI é uma **referência em camadas** para redes, com o objetivo de padronizar a comunicação entre sistemas distintos:

| Camada | Função principal | Exemplo na atividade |
|--------|-----------------|-------------------|
| 2 – Enlace | Endereçamento físico e entrega local | Ethernet, endereços MAC |
| 3 – Rede | Roteamento e endereçamento lógico | IPv4, endereços IP |
| 4 – Transporte | Comunicação confiável entre hosts | TCP, portas de origem/destino |
| 7 – Aplicação | Comunicação entre aplicativos e usuários | HTTP POST, envio de dados |

---

### 2. Camada 2 — Enlace (Ethernet)

- **Função:** Entrega de quadros dentro da mesma rede.  
- **Protocolo:** Ethernet II  
- **Campos observados no pacote:**  
  - Endereço MAC de origem: `aa:aa:aa:aa:aa:aa`  
  - Endereço MAC de destino: `bb:bb:bb:bb:bb:bb`  
  - Tipo EtherType: `0x0800 (IPv4)`  

💡 *O endereço MAC garante a entrega do quadro dentro da rede local.*

---

### 3. Camada 3 — Rede (IPv4)

- **Função:** Endereçamento lógico e roteamento.  
- **Protocolo:** IPv4  
- **Campos observados:**  
  - Endereço IP de origem: `192.168.1.100`  
  - Endereço IP de destino: `192.168.1.200`  
  - Versão do IP: IPv4  
  - Total Length: 224  
  - TTL: 64  
  - Protocolo: TCP  
  - Header Checksum: `0xd955`  

💡 *O IP permite que os pacotes sejam roteados corretamente entre redes diferentes.*

---

### 4. Camada 4 — Transporte (TCP)

- **Função:** Comunicação confiável entre hosts.  
- **Protocolo:** TCP  
- **Campos observados:**  
  - Porta de origem: `54321`  
  - Porta de destino: `80`  
  - Número de sequência (Sequence Number): 1  
  - Número de confirmação (Acknowledgment Number): 1  
  - Flags TCP: `PSH, ACK` (0x018)  
  - Window size: 64240  
  - Checksum TCP: 0x8024  

💡 *A camada de transporte garante que os dados cheguem completos e na ordem correta.*

---

### 5. Camada 7 — Aplicação (HTTP)

- **Função:** Comunicação entre aplicações e usuários.  
- **Protocolo:** HTTP  
- **Campos observados:**  
  - Método HTTP: `POST`  
  - Caminho: `/login.php`  
  - Host header: `testphp.vulnweb.com`  
  - Content-Type: `application/x-www-form-urlencoded`  
  - Content-Length: 27  
  - Corpo do POST: `username=aluno&password=senha123`  

💡 *O HTTP POST é usado para enviar informações do cliente para o servidor.*

# 🧠 Atividade 01 — Análise de um Pacote de Rede com Wireshark  

📚 **Disciplina:** Redes de Computadores  
🧩 **Sprint:** 01 — Fundamentos e Modelo OSI  
🧑‍💻 **Aluno:** Gabriel Demétrio  

---

## 🎯 Objetivo  

Abrir o arquivo `lab_activity1.pcap` no **Wireshark**, analisar um pacote **HTTP POST** presente no arquivo e identificar os campos correspondentes em cada camada do **modelo OSI** (Enlace, Rede, Transporte e Aplicação).  

> O arquivo contém um único frame Ethernet com um pacote IPv4/TCP, incluindo uma requisição HTTP POST com credenciais de exemplo.

---

## ⚙️ Procedimento  

1. Iniciar o **Kali Linux** através da máquina virtual *“VMware virtual machine”*.  
   ![VMware - Kali Linux](./imagens/kali-linux.png)

   - Nome: `kali-linux-2025.3-vmware-amd64`

2. Ligar a máquina em **“Power on this virtual machine”**.  
   ![Power on the virtual machine](./imagens/power-on.png)

3. Entrar com as credenciais:  
   **Usuário:** `kali`  
   **Senha:** `kali`

4. Abrir o arquivo `lab_activity1.pcap` no Wireshark e localizar o pacote com o método **HTTP POST**.

---

## 🔍 Análise das Camadas (Modelo OSI)

### 🧩 **Camada 2 — Enlace (Ethernet)**  
![Camada 2 - Ethernet](./imagens/camada2-ethernet.png)

- **Endereço MAC de origem:** `aa:aa:aa:aa:aa:aa`  
- **Endereço MAC de destino:** `bb:bb:bb:bb:bb:bb`  
- **Tipo EtherType:** `0x0800 (IPv4)`  

---

### 🌐 **Camada 3 — Rede (IPv4)**  
![Camada 3 - IPv4](./imagens/camada3-ipv4.png)

- **Endereço IP de origem:** `192.168.1.100`  
- **Endereço IP de destino:** `192.168.1.200`  
- **Versão:** IPv4  
- **Total Length:** `224`  
- **TTL:** `64`  
- **Protocolo:** `TCP (6)`  
- **Header Checksum:** `0xd955`

---

### ⚙️ **Camada 4 — Transporte (TCP)**  
![Camada 4 - TCP](./imagens/camada4-tcp.png)

- **Porta de origem:** `54321`  
- **Porta de destino:** `80`  
- **Sequence Number:** `1`  
- **Acknowledgment Number:** `1`  
- **Flags:** `PSH, ACK (0x018)`  
- **Window Size:** `64240`  
- **Checksum TCP:** `0x8024`

---

### 💬 **Camada 7 — Aplicação (HTTP)**  
![Camada 7 - HTTP](./imagens/camada7-http.png)

- **Método HTTP:** `POST`  
- **Caminho:** `/login.php`  
- **Host:** `testphp.vulnweb.com`  
- **Content-Type:** `application/x-www-form-urlencoded`  
- **Content-Length:** `27`  
- **Corpo do POST:** `username=aluno&password=senha123`

---

## 🧾 **Follow TCP Stream**  

Utilizando a função **Follow → TCP Stream**, foi possível visualizar o corpo completo da requisição HTTP.  
![Follow TCP Stream](./imagens/follow-tcp-stream.png)

---

## 🧠 **Respostas às Questões**

- **Em qual camada do modelo OSI a senha aparece? Por quê?**  
  A senha é transmitida na **Camada 7 (Aplicação)**, pois é onde ocorre a troca de dados entre cliente e servidor.  

- **Qual é o IP de origem e IP de destino? Eles pertencem à mesma rede?**  
  - IP de origem: `192.168.1.100`  
  - IP de destino: `192.168.1.200`  
  Sim, pertencem à mesma rede, pois compartilham o mesmo prefixo e conseguem se comunicar diretamente.  

- **Qual porta TCP foi usada como destino? Por que é significativa?**  
  A **porta 80** foi utilizada como destino. Ela é significativa por ser a porta padrão do protocolo **HTTP**, que transmite dados **sem criptografia**.  

---

## 💡 **Observações Finais**

- O pacote analisado não utiliza criptografia (HTTP sem TLS).  
- Em redes reais, haveria uma sequência de pacotes de conexão TCP (SYN, SYN-ACK, ACK).  
- O foco deste exercício é a **compreensão das camadas do modelo OSI** e a **análise de pacotes com Wireshark**.

