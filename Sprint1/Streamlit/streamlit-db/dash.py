import streamlit as st
import pandas as pd
import plotly.express as px
from streamlit_option_menu import option_menu
from query import connection # Consulta no banco de dados

# Consulta SQL
query = "SELECT * FROM tb_carro"

# Carregar os dados para a variavel df
df = connection(query)

# Atualização - Botão
if st.button("Atualizar Dados"):
    df = connection(query)
    
# ***********************
# Estrutura de Filtro Lateral
# sidebar - barra lateral
marca = st.sidebar.multiselect(
    "Marca Selecionada",
    options=df["marca"].unique(),
    default=df["marca"].unique()
)
modelo = st.sidebar.multiselect(
    "Modelo Selecionado",
    options=df["modelo"].unique(),
    default=df["modelo"].unique()
)
ano = st.sidebar.multiselect(
    "Ano Selecionado",
    options=df["ano"].unique(),
    default=df["ano"].unique()
)
valor = st.sidebar.multiselect(
    "Valor Selecionado",
    options=df["valor"].unique(),
    default=df["valor"].unique()
)
cor = st.sidebar.multiselect(
    "Cor Selecionada",
    options=df["cor"].unique(),
    default=df["cor"].unique()
)

min_sales = int(df["numero_vendas"].min())
max_sales = int(df["numero_vendas"].max())

sales = st.sidebar.slider(
    "Intervalo de Número de Vendsa Selecionado",
    min_value=min_sales,
    max_value=max_sales,
    value=(min_sales, max_sales) # Valor Inicial
)

# Verificação da aplicação dos filtros
selected_df = df[
    (df["marca"].isin(marca)) &
    (df["modelo"].isin(modelo)) &
    (df["ano"].isin(ano)) &
    (df["valor"].isin(valor)) &
    (df["cor"].isin(cor)) &
    (df["numero_vendas"] >= sales[0]) &
    (df["numero_vendas"] <= sales[1]) 
]

def Home():
    with st.expander("Carros"):
        exhibition = st.multiselect(
            "Filtro", 
            selected_df.columns,
            default=[],
            key="Filtro_Exibicao"
        )
        if exhibition:
            st.write(selected_df[exhibition])
    if not selected_df.empty:
        total_sales = selected_df["numero_vendas"].sum()
        mean_values = selected_df["valor"].mean()
        mean_sales = selected_df["numero_vendas"].mean()

        card1, card2, card3 = st.columns(3, gap="large")
        with card1:
            # Apresentando indicadores rápidos
            st.info("Total de Vendas", icon="👽") 
            st.metric(label="Total", value=f"{total_sales:,.0f}")

        with card2:
            st.info("Média de Valores", icon="👽")
            st.metric(label="Média", value=f"{mean_values:,.0f}")

        with card3:
            st.info("Média de Vendas", icon="👽")
            st.metric(label="Média", value=f"{mean_sales:,.0f}")
    
    else:
        st.warning("Nenhum dado disnponível com os filtros selecionados")
    st.markdown("""-----""")

def Graphs(selected_df):
    if selected_df.empty:
        st.warning("Nenhum dado disnponível para gerar os gráficos")
        return
    graf1, graf2, graf3, graf4 = st.tabs([
        "Gráfico de Barras",
        "Gráfico de Linhas",
        "Gráfico de Pizza",
        "Gráfico de Dispersão"
    ])
    with graf1:
        st.write("Gráfico de Barras")
        valor_barras = selected_df.groupby("marca").count()[["valor"]].sort_values(by="valor", ascending=True)

        fig1 = px.bar(
            valor_barras,
            x=valor_barras.index,
            y="valor",
            orientation="h",
            title="Valores dos Carros",
            color_discrete_sequence=["#0083b8"]
        )
    st.plotly_chart(fig1, use_container_width=True)

    with graf2:
        st.write("Gráfico de Linhas")
        valor_linhas = selected_df.groupby("modelo").count()[["valor"]]

        fig2 = px.line(
            valor_linhas,
            x=valor_linhas.index,
            y="valor",
            title="Valor por Modelo",
            color_discrete_sequence=["#e9e6a4"]

        )
    st.plotly_chart(fig2, use_container_width=True)

    with graf3:
        st.write("Gráfico de Pizza")
        valor_pizza = selected_df.froupby().count()[["valor"]]

        fig3 = px.pie
Home()
Graphs(selected_df)
