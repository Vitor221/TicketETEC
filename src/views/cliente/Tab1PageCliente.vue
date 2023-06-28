<template>
  <ion-page>
    <ion-header>
      <ion-toolbar>
        <ion-title>Novo Ticket</ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content class="ion-padding">
      <ion-button expand="full" @click="openModal">Abrir Modal</ion-button>
    </ion-content>

    <ion-modal :is-open="showModal" @dismiss="closeModal">
      <ion-header>
        <ion-toolbar>
          <ion-title>Novo Ticket</ion-title>
        </ion-toolbar>
      </ion-header>

      <ion-content class="ion-padding">
        <form @submit.prevent="saveTicket">
          <ion-list>
            <ion-item>
              <ion-label position="stacked">Descrição do Ticket</ion-label>
              <ion-textarea v-model="descricao" class="form-textarea"></ion-textarea>
            </ion-item>

            <ion-item>
              <ion-label position="stacked">Data de Início</ion-label>
              <ion-datetime v-model="dataInicio" display-format="DD/MM/YYYY" picker-format="DD/MM/YYYY" class="form-datetime"></ion-datetime>
            </ion-item>

            <ion-item>
              <ion-label position="stacked">Data de Término</ion-label>
              <ion-datetime v-model="dataTermino" display-format="DD/MM/YYYY" picker-format="DD/MM/YYYY" class="form-datetime"></ion-datetime>
            </ion-item>

            <ion-item>
              <ion-label position="stacked">Hora de Início</ion-label>
              <ion-datetime v-model="horaInicio" display-format="HH:mm" picker-format="HH:mm" class="form-datetime"></ion-datetime>
            </ion-item>

            <ion-item>
              <ion-label position="stacked">Hora de Término</ion-label>
              <ion-datetime v-model="horaTermino" display-format="HH:mm" picker-format="HH:mm" class="form-datetime"></ion-datetime>
            </ion-item>

            <ion-item>
              <ion-label position="stacked">Gravidade do Ticket</ion-label>
              <ion-select v-model="gravidade" class="form-select">
                <ion-select-option value="alta">Alta</ion-select-option>
                <ion-select-option value="media">Média</ion-select-option>
                <ion-select-option value="baixa">Baixa</ion-select-option>
              </ion-select>
            </ion-item>

            <ion-item>
              <ion-label position="stacked">Status</ion-label>
              <ion-select v-model="status" class="form-select">
                <ion-select-option value="em-andamento">Em Andamento</ion-select-option>
                <ion-select-option value="resolvido">Resolvido</ion-select-option>
              </ion-select>
            </ion-item>
          </ion-list>

          <ion-button expand="full" type="submit" class="form-button">Salvar</ion-button>
          <ion-button expand="full" color="danger" @click="closeModal" class="form-button">Cancelar</ion-button>
        </form>
      </ion-content>
    </ion-modal>
  </ion-page>
</template>

<script>
import { IonContent, IonHeader, IonToolbar, IonTitle, IonModal, IonButton, IonPage, IonTextarea, IonDatetime, IonList, IonItem, IonLabel, IonSelect, IonSelectOption } from '@ionic/vue';
import { defineComponent } from 'vue';
import axios from 'axios';

export default defineComponent ({
  name: 'Tab1PageCliente',
  components: {
    IonContent,
    IonModal,
    IonPage,
    IonButton,
    IonTextarea,
    IonDatetime,
    IonList,
    IonItem,
    IonLabel,
    IonSelect,
    IonSelectOption,
    IonHeader,
    IonToolbar,
    IonTitle
  },
  data() {
    return {
      showModal: false,
      descricao: '',
      dataInicio: '',
      dataTermino: '',
      horaInicio: '',
      horaTermino: '',
      gravidade: '',
      status: ''
    };
  },
  methods: {
    openModal() {
      this.showModal = true;
    },
    closeModal() {
      this.showModal = false;
      // Limpar os campos ao fechar o modal
      this.descricao = '';
      this.dataInicio = '';
      this.dataTermino = '';
      this.horaInicio = '';
      this.horaTermino = '';
      this.gravidade = '';
      this.status = '';
    },
    saveTicket() {
      // Aqui você pode implementar a lógica para salvar o ticket
      // Exemplo de exibição dos valores preenchidos:
      console.log('Descrição:', this.descricao);
      console.log('Data de Início:', this.dataInicio);
      console.log('Data de Término:', this.dataTermino);
      console.log('Hora de Início:', this.horaInicio);
      console.log('Hora de Término:', this.horaTermino);
      console.log('Gravidade:', this.gravidade);
      console.log('Status:', this.status);

      axios.post('http://localhost:3000/api/ticket', {
        descricao: this.descricao,
        dataInicio: this.dataInicio,
        dataTermino: this.dataTermino,
        horaInicio: this.horaInicio,
        horaTermino: this.horaTermino,
        gravidade: this.gravidade,
        status: this.status
      })
          .then(response => {
            console.log(response.data);
            this.closeModal();
          }).catch(error => {
            console.log(error);
      })
    }
  }
})
</script>

<style scoped>
.form-textarea {
  height: 150px;
}

.form-datetime {
  --padding-end: 0;
}

.form-select {
  max-width: 100%;
}

.form-button {
  margin-top: 16px;
}
</style>
