using KSP.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace KSP.Controllers
{
    [ApiController]
    [Route("api/Empleados")]
    public class EmpleadoController : ControllerBase
    {

        private readonly KspExamenContext context;

        public EmpleadoController(KspExamenContext context)
        {
            this.context = context;
        }

        [HttpGet]
        public async Task<ActionResult<List<Empleado>>> Get()
        {
            return await context.Empleados.ToListAsync();
        }

        


        [HttpGet]
        [Route("Activos")]
        public async Task<ActionResult<List<Empleado>>> GetActive()
        {
            try
            {
                return await context.Empleados.Where(x => x.Estatus == true).ToListAsync();
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);

            }

        }

        [HttpGet]
        [Route("Obtener")]
        public async Task<ActionResult<List<Empleado>>> ObtenerId(int id)
        {
            var existe = await context.Empleados.AnyAsync(x => x.Id == id);

            if (!existe)
            {
                return NotFound();
            }
            return await context.Empleados.Where(x=>x.Id==id).ToListAsync();
        }

        [HttpPost]
        [Route("Editar")]
        public async Task<ActionResult> Edicion(Empleado em)
        {
            var existe = await context.Empleados.AnyAsync(x => x.Id == em.Id);

            if (!existe)
            {
                return NotFound();
            }
            context.Empleados.Update(em);
            await context.SaveChangesAsync();
            return Ok();
        }






            //Agregar
        [HttpPost]
        [Route("Add")]
        public async Task<ActionResult> Agregar(Empleado empleado)
        {
            try
            {
                context.Add(empleado);
                await context.SaveChangesAsync();

                return Ok();
            }
            catch (Exception ex)
            {

                // throw (ex);

                return BadRequest(ex.Message);
            }



        }


        //EliminacionLogica
        [HttpPost]
        [Route("Delete")]
        public async Task<ActionResult> EliminacionLogica(Empleado em)
        {
            var existe = await context.Empleados.AnyAsync(x => x.Id == em.Id);

            if (!existe)
            {
                return NotFound();
            }
            var empleado = await context.Empleados.FindAsync(em.Id);
            empleado.Estatus = em.Estatus;
            await context.SaveChangesAsync();
            return Ok();

        }


    }
}
