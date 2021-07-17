<template>
  <v-app>
    <v-card>
      <v-btn @click="toTop()">Topへ</v-btn>
      <v-dialog v-model="editDialog">
        <!-- アクティベータースロット -->
        <template v-slot:activator="{ on }">
          <v-btn @click="openEdit()" v-on="on">
            編集
          </v-btn>
        </template>
        <!-- ダイアログコンテンツ -->
        <v-card>
          <v-card-title>レシピの編集</v-card-title>
          <v-card-text>
            <v-card-subtitle>レシピ名</v-card-subtitle>
            <v-text-field
              type="text"
              v-model="name"
            ></v-text-field>
            <v-card-subtitle>このレシピについて</v-card-subtitle>
            <v-textarea
              type="text"
              v-model="explanation"
            >
            </v-textarea>
            <v-card-subtitle>材料</v-card-subtitle>
            <v-textarea
              type="text"
              v-model="foodstuff"
            >
            </v-textarea>
            <v-card-actions>
              <v-btn>材料を追加する</v-btn>
            </v-card-actions>
            <v-card-subtitle>作り方</v-card-subtitle>
            <v-textarea
              type="text"
              v-model="how"
            >
            </v-textarea>
            <v-card-actions>
              <v-btn>作り方を追加する</v-btn>
            </v-card-actions>
          </v-card-text>
          <v-card-actions>
            <v-btn @click="update()">
              更新する
            </v-btn>
          </v-card-actions>
          <v-card-actions>
            <v-btn @click="editDialog = false">
              キャンセル
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
      <v-dialog v-model="deleteDialog">
        <!-- アクティベータースロット -->
        <template v-slot:activator="{ on }">
          <v-btn @click="openDelete()" v-on="on">
            削除
          </v-btn>
        </template>
        <!-- ダイアログコンテンツ -->
        <v-card>
          <v-card-title>このレシピを削除しますか？</v-card-title>
          <v-card-actions>
            <v-btn @click="deleteDialog = false">
              キャンセル
            </v-btn>
          </v-card-actions>
          <v-card-actions>
            <v-btn @click="destroy()">
              削除する
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
      <v-card-text>{{ recipe.name }}</v-card-text>
      <v-card-text>{{ recipe.explanation }}</v-card-text>
      <v-card-text>{{ recipe.foodstuff }}</v-card-text>
      <v-card-text>{{ recipe.how }}</v-card-text>
    </v-card>
  </v-app>
</template>

<script>
export default {
  data: () => {
    return {
      editDialog: false,
      deleteDialog: false,
      recipe: {},
      name: "",
      explanation: "",
      foodstuff: "",
      how: "",
    }
  },
  mounted() {
    this.fetchContent()
  },
  methods:{
    toTop() {
      this.$router.push('/recipes')
    },
    fetchContent() {
      const url = `api/v1/recipes/${this.$route.params.id}`
      this.$axios.get(url)
        .then(res => this.recipe = res.data.data)
        .catch(error => console.log(error));
    },
    openEdit() {
      this.name = this.recipe.name
      this.explanation = this.recipe.explanation
      this.foodstuff = this.recipe.foodstuff
      this.how = this.recipe.how
    },
    openDelete() {

    },
    update() {
      const url = `api/v1/recipes/${this.$route.params.id}`
      const recipe = {
        name: this.name,
        explanation: this.explanation,
        foodstuff: this.foodstuff,
        how: this.how,
      };
      console.log(recipe)
      this.$axios.put(url, {recipe})
        .then(res => {
          console.log(res.status)
          this.recipe = res.data.data
          this.editDialog = false
        })
        .catch(error => console.log(error));
    },
    destroy() {
      const url = `api/v1/recipes/${this.$route.params.id}`
      this.$axios.delete(url)
        .then(res => {
          console.log(res.status)
          this.toTop()
        })
        .catch(error => console.log(error));
    }
  }
}
</script>