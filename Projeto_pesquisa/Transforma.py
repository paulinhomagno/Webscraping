import pandas as pd
import os
    
def arquivos_em_df (diretorio):
        
    list_path = os.listdir(diretorio)
    
    df0 = pd.DataFrame()
    
    for arquivo in list_path:
        
        caminho = os.path.join(diretorio, arquivo)
        df = pd.read_csv(caminho, sep = '|', encoding = 'latin-1')
        df_final = pd.concat([df0, df])
        df0 = df_final
        
    return df_final