// prisma/seed.ts
const { PrismaClient } = require("@prisma/client")

const prisma = new PrismaClient();

async function main() {
  // Example: seeding a users table
  await prisma.sprintCategory.create({
    data: {
      categoryName: "Front End",
      sprints: {
        create: [
          {
            sprintName: "nc-news",
            repoLink: "",
            lmsLink: "https://l2c.northcoders.com/courses/fe/fe-nc-news",
            tasks: {
              create: [
                {
                  taskName: "Create a React project and a public repo",
                  taskNumber: 1,
                  advanced: false,
                },
                

              ]
            }
          },
        ],
      },
    },
  });
  // Add more seeding logic as needed
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
