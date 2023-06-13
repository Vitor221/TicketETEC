<template>
  <ion-page>
    <div class="form">
      <div class="form-container">
        <form>
          <h1>Login</h1>

          <ion-item>
            <ion-label>email</ion-label>
            <ion-input type="text" v-model="form.email"/>
          </ion-item>

          <ion-item>
            <ion-label>Senha</ion-label>
            <ion-input type="password"  v-model="form.senha"/>
          </ion-item>
          
        </form>
      </div>

      <ion-button class="button" type="submit" @click="enviarLogin()">Entrar</ion-button>
    </div>
    
    
  </ion-page>
</template>

<script>
import { IonPage, IonToolbar, IonTitle, IonButtons, IonButton, IonInput } from '@ionic/vue';
import { defineComponent } from 'vue';
import axios from 'axios';

export default defineComponent ({
  name: 'Login',
  components: {
    IonPage,
    IonToolbar,
    IonTitle,
    IonButtons,
    IonButton,
    IonInput,
  },
  data: () => ({
    form: {
      email: '',
      senha: ''
    },
    db: []
  }),
  mounted() {
        this.DadosPHP();
    },
  methods: {
    enviarLogin() {
      const user = this.db.reduce((funcionario, aluno) => {
        if(aluno.cd_email_login === this.form.email && aluno.cd_senha_login === this.form.senha) {
          return true;
        } else {
          if(funcionario.cd_email_atendente === this.form.email && funcionario.cd_senha_atendente === this.form.senha) {
            return true;
          }
        }
      }, false);
    },
    DadosPHP() {
        axios.get('http://localhost/Api-php/index.php')
            .then(response => {
            this.db = response.data;
            // Aqui você pode usar os dados recebidos como desejar
            })
            .catch(error => {
            console.error(error);
            });
        }
   
  },
  
  
})
</script>

<style scoped>
.form {
  display: flex;
  height: 100%;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
  padding-bottom: 20px;
}

.form-container {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.button {
  margin-top: auto;
}

</style>