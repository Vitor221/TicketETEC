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

    <ion-content class="ion-padding">
      <!-- Exibir os tickets -->
      <ion-list>
        <ion-item v-for="ticket in tickets" :key="ticket.id" style="margin-top: 3%">
          <ion-label><strong>Descrição:</strong> {{ ticket.ds_descricao_ticket }}</ion-label>
          <ion-label><strong>Data da publicação:</strong> {{ formatarData(ticket.hr_data_inicio) }}</ion-label>
          <ion-label><strong>Gravidade: </strong>{{ ticket.ds_gravidade_ticket }}</ion-label>
          <ion-label><strong>Status: </strong>{{ ticket.ds_status_ticket }}</ion-label>
        </ion-item>
      </ion-list>
    </ion-content>
  </ion-page>
</template>

<script>
import { IonContent, IonHeader, IonToolbar, IonTitle, IonModal, IonButton, IonPage, IonTextarea, IonDatetime, IonList, IonItem, IonLabel, IonSelect, IonSelectOption } from '@ionic/vue';
import { defineComponent } from 'vue';
import axios from 'axios';
import moment from 'moment';

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
      status: '',
      tickets: []
    };
  },
  methods: {
    openModal() {
      this.showModal = true;
    },
    closeModal() {
      this.showModal = false;
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
      }, {
        headers: {
          'Content-Type': 'application/json'
        }
      })
          .then(response => {
            console.log(response.data);
            this.fetchTickets();
            this.closeModal();
          }).catch(error => {
            console.log(error);
      })
    },
    fetchTickets() {
      axios.get('http://localhost:3000/api/tickets')
          .then(response => {
            this.tickets = response.data;
          })
          .catch(error => {
            console.log(error);
          })
    },
    formatarData(dateTime) {
      const formatandoData = moment(dateTime).locale('pt-BR').format('DD/MM/YYYY [às] HH:mm');

      return formatandoData;
    }
  },
  mounted() {
    this.fetchTickets();
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
