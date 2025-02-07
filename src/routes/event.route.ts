import { Router } from 'express'
import {
  checkJoin,
  createEvent,
  deleteEventById,
  getAllEvents,
  getEventById,
  myEvents,
  myRegistration,
  registerParticipation,
  searchEventName,
  updateEvent,
  updateStatusMyEvent,
} from '~/controller/eventController'

const eventRoutes = Router()
eventRoutes.get('/', getAllEvents)
eventRoutes.post('/', createEvent)
eventRoutes.post('/check-registration', checkJoin)
eventRoutes.post('/my-events', myEvents)
eventRoutes.post('/registration-events', myRegistration)
eventRoutes.post('/search', searchEventName)
eventRoutes.post('/update-status', updateStatusMyEvent)
eventRoutes.put('/update-event', updateEvent)
eventRoutes.delete('/delete-event', deleteEventById)
eventRoutes.get('/:id', getEventById)
eventRoutes.post('/:id/register', registerParticipation)

export default eventRoutes
